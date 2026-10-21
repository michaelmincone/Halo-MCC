#!/usr/bin/env python3
"""Read-only inspection of Request4; writes JSON evidence beside this script.

Run with python3 -B. Neither the source variant nor installed game is modified.
"""
import collections
import dataclasses
import datetime
import hashlib
import json
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[3]
OUT = Path(__file__).resolve().parent
sys.dont_write_bytecode = True
sys.path.insert(0, str(ROOT / "forge/tools/mjolnir_forge"))
from mvarlib.model import MapVariant


def main():
    source = Path(sys.argv[1] if len(sys.argv) > 1 else
                  "/Users/michaelmincone/Downloads/Request4.mvar")
    data = source.read_bytes()
    digest = hashlib.sha256(data).hexdigest()
    model = MapVariant.from_bytes(data, name=source.name)
    objects = model.objects()
    counts = collections.Counter((o.folder, o.item) for o in objects)
    spans = {name: (start, end) for name, start, end in model.spans()}
    prices = {
        row["quota_index"]: row
        for row in json.loads((ROOT / "forge/tools/palette_costs.json").read_text())["rows"]
    }

    # This fixture decoder implements its own BLF expansion and bit walker.
    sys.path.insert(0, str(ROOT / "forge/Mjolnir-Forge-Editor/tests/unit"))
    import helpers_fixtures
    _, independent = helpers_fixtures.modules()
    second = independent.read(data)
    assert second["outcome"] == "ok", second
    decoded = second["decoded"]
    second_counts = collections.Counter(
        (s["folder"], s["item"]) for s in decoded["slots"].values())
    assert second_counts == counts
    assert decoded["quotas"] == [list(q.as_tuple()) for q in model.quotas]
    assert decoded["sections"]["end"] == model.end_bit
    assert len(decoded["slots"]) == model.occupied == len(objects)
    for slot in model.present_slots():
        second_slot = decoded["slots"][slot.index]
        for key in ("folder", "item", "pos", "flags2", "placement", "parent_raw",
                    "respawn", "cached_type", "up_global", "up_code", "angle"):
            assert getattr(slot, key) == second_slot[key], (slot.index, key)

    rows = []
    for (folder, item), count in sorted(counts.items()):
        group = [o for o in objects if (o.folder, o.item) == (folder, item)]
        quota = model.quotas[folder]
        price = prices[folder]
        start, end = spans["quota_%d" % folder]
        rows.append({
            "name": group[0].type_name,
            "folder": folder, "item": item,
            "actual_saved_objects": count,
            "distinct_positions": len({o.position for o in group}),
            "slots": [o.slot for o in group],
            "quota_minimum": quota.minimum,
            "quota_maximum": quota.maximum,
            "quota_placed": quota.placed,
            "quota_hex": bytes(quota.as_tuple()).hex(" "),
            "quota_bit_range_in_decompressed_stream": [start, end],
            "installed_mcc_category_cap": price["maximum_allowed"],
            "installed_mcc_unit_price": price["price_per_instance"],
            "actual_count_cost": count * price["price_per_instance"],
            "byte_wrapped_count": count & 255,
            "all_stock": all(o.stock for o in group),
            "all_place_at_start": all(o.place_at_start for o in group),
            "all_unparented": all(o.parent_slot == -1 for o in group),
        })

    authors = []
    for kind, author in (("created", model.header.created_by),
                         ("modified", model.header.modified_by)):
        authors.append({"kind": kind, "name": author.name_text,
                        "timestamp_utc": datetime.datetime.fromtimestamp(
                            author.timestamp, datetime.timezone.utc).isoformat()})
    evidence = {
        "source": str(source), "source_sha256": digest, "source_bytes": len(data),
        "title": model.header.title_text, "description": model.header.description_text,
        "authors_as_stored_not_authenticated": authors,
        "map_id": model.map_id, "map_name": model.map_name,
        "version": model.version, "quota_rows": len(model.quotas),
        "total_saved_objects": model.occupied, "format_slot_capacity": len(model.slots),
        "unused_slots": len(model.slots) - model.occupied,
        "labels": model.info().labels,
        "all_quota_minimums_zero": all(q.minimum == 0 for q in model.quotas),
        "stored_budget_maximum": model.fixed.max_budget,
        "stored_budget_spent": model.fixed.spent_budget,
        "cost_at_installed_mcc_prices": sum(r["actual_count_cost"] for r in rows),
        "cost_using_wrapped_counts": sum(r["byte_wrapped_count"] * r["installed_mcc_unit_price"] for r in rows),
        "sha1_recipe": model.info().hash_flavour,
        "sha1_stored": model.chunk.hash_stored.hex(),
        "sha1_recipe_matched": model.chunk.flavour is not None,
        "hashed_stream_bytes": model.chunk.stored_length,
        "end_bit": model.end_bit,
        "compressed_wrapper": {"type": model.chunk.cmp.ctype,
                               "expanded_bytes": model.chunk.cmp.usize},
        "independent_decoder_counts_quotas_and_raw_fields_match": True,
        "chunks": [{"signature": c.sig, "original_file_offset": c.offset,
                    "original_file_bytes": c.size, "expanded_bytes": len(c.raw),
                    "version": c.version} for c in model.blf.chunks],
        "rows": rows,
        "parser_warnings": [dataclasses.asdict(w) for w in model.warnings],
        "warning_context": [
            "chdr uses big-endian numeric/text fields; the local chdr parser assumes little endian.",
            "The inner header length is 29481, the expanded BLF file size; the compressed file is 6100 bytes.",
            "These warnings do not show a bad payload SHA-1 or a failed object walk.",
        ],
        "evidence_boundary": "Offline file decoding and static PC MCC code only. Xbox loading is reported by the user; no game was launched here.",
    }
    (OUT / "decoded.json").write_text(json.dumps(evidence, indent=2) + "\n")
    (OUT / "objects.json").write_text(json.dumps(
        [dataclasses.asdict(o) | {"raw": o.raw.hex()} for o in objects], indent=2) + "\n")
    assert hashlib.sha256(source.read_bytes()).hexdigest() == digest
    print(json.dumps({"objects": model.occupied, "counts": {
        r["name"]: r["actual_saved_objects"] for r in rows},
        "stored_spent": model.fixed.spent_budget,
        "actual_cost": evidence["cost_at_installed_mcc_prices"],
        "independent_decoder_agrees": True, "source_unchanged": True}, indent=2))


if __name__ == "__main__":
    main()
