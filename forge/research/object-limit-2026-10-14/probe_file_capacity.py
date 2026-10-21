#!/usr/bin/env python3
"""Offline experiments only; no game execution or map files are written.

Uses the installed exporter and its independent fixture decoder. Raising an
editor policy, adding an extra record before quotas, and hiding a record after
quotas are three distinct hypotheses. Neither parser establishes Xbox behavior.
"""
import hashlib
import json
import sys
from pathlib import Path

WORKSPACE = Path(__file__).resolve().parents[3]
ADDON_REPO = WORKSPACE / "forge/Mjolnir-Forge-Editor"
sys.path.insert(0, str(ADDON_REPO / "tests/unit"))
sys.path.insert(0, str(ADDON_REPO / "Addon"))

import helpers_g5 as helpers
from mvarlib.bitio import BitString, BitWriter
from mvarlib.model import MapVariant
from mvarlib import blf, hashing


def digest(data):
    return hashlib.sha256(data).hexdigest()


def summarize_export(result):
    summary = {
        "ok": result.ok,
        "errors": [{"code": e.code, "message": e.message} for e in result.errors],
        "stats": result.stats,
    }
    if result.ok:
        model = MapVariant.from_bytes(result.data)
        independently_decoded = helpers.decode(result.data)
        assert model.occupied == len(independently_decoded["slots"])
        summary.update(
            occupied=model.occupied,
            table_slots=len(model.slots),
            last_present_slot=model.present_slots()[-1].index,
            data_sha256=digest(result.data),
            independent_hash_matches=helpers.stored_hash(result.data)
            == helpers.independent_hash(model.flavour.recipe, result.data),
        )
    return summary


def render_probe(model, stream):
    container = model.blf
    container.find("mvar").set_stream(stream, 0x7000)
    return container.render(stream_length={"mvar": 0x7000}).data


def summarize_mutation(data, reference):
    container = blf.parse(data)
    chunk = container.find("mvar")
    summary = {
        "data_sha256": digest(data),
        "stored_length": chunk.stored_length,
        "hash_valid": chunk.hash_stored == hashing.compute(
            chunk.flavour, chunk.stream, chunk.stored_length
        ),
        "independent_hash_matches": helpers.stored_hash(data)
        == helpers.independent_hash(chunk.flavour.recipe, data),
    }
    try:
        model = MapVariant.from_bytes(data)
        independent = helpers.decode(data)
        summary.update(
            decoded=True,
            table_slots=len(model.slots),
            occupied=model.occupied,
            independent_occupied=len(independent["slots"]),
            existing_slot_bits_unchanged=all(
                a.raw == b.raw for a, b in zip(model.slots, reference.slots)
            ),
            quota_rows_changed=sum(
                a.as_tuple() != b.as_tuple()
                for a, b in zip(model.quotas, reference.quotas)
            ),
            nonzero_tail=model.tail.to_int() != 0,
            warnings=[w.code for w in model.warnings],
        )
    except Exception as error:
        summary.update(decoded=False, error_type=type(error).__name__, error=str(error))
    return summary


def main():
    sample = WORKSPACE / "forge/real-mvar-samples/0aaaf8c7-5ae6-43ba-bb4d-37c987f5e8b8.mvar"
    original = sample.read_bytes()
    before = digest(original)
    assert before == "e514a53b61977a897ac9dbf7225085aa01b5b255f3c8079b5938ef87579bb254"
    model = MapVariant.from_bytes(original)
    original_objects = helpers.objects_for(model)
    additions = [
        helpers.new_object(
            "Capacity probe %03d" % i, "Block, 1x1",
            (float(i) * 2.0, 0.0, 30.0), forward=(1.0, 0.0, 0.0), physics=1
        )
        for i in range(42)
    ]
    options = dict(allow_unverified_rotation=True, raise_quota_max=True)
    cases = {}
    full = None
    for count, cap in ((650, 650), (651, 650), (651, 651), (652, 1000)):
        exported = helpers.export(original, original_objects + additions[:count - model.occupied],
                                  max_objects=cap, **options)
        cases["request_%d_policy_%d" % (count, cap)] = summarize_export(exported)
        if count == 651 and cap == 651:
            full = MapVariant.from_bytes(exported.data)
    assert full is not None and full.occupied == 651
    extra = full.slots[-1].raw
    slots_end = full.end_bit - 24 * len(full.quotas)
    source_bits = BitString(full.chunk.stream, 0x7000 * 8)
    # Inject a 652nd presence+object record immediately after all 651 slots.
    # The ordinary decoder treats these bits as quota rows, not another object.
    inserted = BitWriter()
    inserted.write_bitstring(source_bits.slice(0, slots_end))
    inserted.write_bitstring(extra)
    inserted.write_bitstring(source_bits.slice(slots_end, full.end_bit))
    cases["extra_record_before_quotas"] = summarize_mutation(
        render_probe(full.copy(), inserted.getvalue(0x7000)), full
    )
    # A record hidden in unused payload capacity cannot extend the fixed loop.
    appended = BitWriter()
    appended.write_bitstring(source_bits.slice(0, full.end_bit))
    appended.write_bitstring(extra)
    cases["extra_record_after_quotas"] = summarize_mutation(
        render_probe(full.copy(), appended.getvalue(0x7000)), full
    )
    assert cases["request_650_policy_650"]["occupied"] == 650
    assert cases["request_651_policy_651"]["occupied"] == 651
    assert cases["request_652_policy_1000"]["errors"][0]["code"] == "E_NO_FREE_SLOT"
    for name in ("extra_record_before_quotas", "extra_record_after_quotas"):
        assert cases[name]["hash_valid"] and cases[name]["independent_hash_matches"]
        assert cases[name]["table_slots"] == cases[name]["occupied"] == 651
        assert cases[name]["existing_slot_bits_unchanged"]
    after = digest(sample.read_bytes())
    assert before == after
    print(json.dumps({
        "scope": "Offline parsers/exporter only; no Xbox, file-share or runtime validation",
        "sample_sha256": before,
        "sample_unchanged": before == after,
        "original_occupied": model.occupied,
        "extra_record_bits": extra.nbits,
        "cases": cases,
    }, indent=2))


if __name__ == "__main__":
    main()
