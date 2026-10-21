#!/usr/bin/env python3
"""Uncalibrated, continuous ballistic estimates for stock Reach Spartan jumps.

WU coordinates: launch feet at (0, 0, 0), +x forward, +z up. Constant
horizontal speed; no sprint, abilities, steering, obstacles, or moving pieces.
Native tag/default gravity values are inputs, not proof of effective game physics.
Unknowns include Havok timestep/integration, air control, collision and traits.
Never use a passing estimate as gameplay certification. See parkour rules.md.
CLI exit 0 means JSON was computed; inspect gap_check.ideal_design_policy_pass.
"""
import argparse
from dataclasses import asdict, dataclass
import json
import math


def number(name, value, minimum=None, positive=False):
    if not isinstance(value, (int, float)) or isinstance(value, bool) or not math.isfinite(value):
        raise ValueError(f"{name} must be a finite number")
    if (positive and value <= 0) or (minimum is not None and value < minimum):
        raise ValueError(f"{name} outside allowed range")
    return value


@dataclass(frozen=True)
class Profile:
    speed: float = 2.2
    gravity: float = 4.17125940322876
    jump_velocity: float = 2.3
    ground_acceleration: float = 8.5
    radius: float = 0.175
    standing_height: float = 0.65

    def __post_init__(self):
        for name, value in asdict(self).items():
            number(name, value, positive=True)
        if self.standing_height < 2 * self.radius:
            raise ValueError("standing_height must contain the capsule diameter")


def estimate(elevation=0.0, profile=Profile(), setback=None, inset=None,
             landing_reserve=0.10, rise_margin=0.10, samples=24, front_face_extension=0.0164):
    """Estimate descending foot contact with an infinite landing-height plane.

    Insets are center-to-edge distances. The extra landing reserve is a design
    policy, not a measured game tolerance. Runup assumes constant acceleration.
    Front-face extension is a conservative stock Flat geometry allowance beyond
    the usable core edge; custom pieces need their actual outer-face offset.
    """
    number("elevation", elevation)
    setback = profile.radius + 0.10 if setback is None else setback
    inset = profile.radius + 0.10 if inset is None else inset
    number("setback", setback, minimum=profile.radius)
    number("inset", inset, minimum=profile.radius)
    number("landing_reserve", landing_reserve, minimum=0)
    number("rise_margin", rise_margin, minimum=0)
    number("front_face_extension", front_face_extension, minimum=0)
    if not isinstance(samples, int) or isinstance(samples, bool) or samples < 2:
        raise ValueError("samples must be an integer >= 2")
    v, g, speed = profile.jump_velocity, profile.gravity, profile.speed
    apex_time, apex = v / g, v * v / (2 * g)
    discriminant = v * v - 2 * g * elevation
    if discriminant < -1e-12:
        raise ValueError("landing height exceeds theoretical foot apex")
    time = (v + math.sqrt(max(0.0, discriminant))) / g
    displacement = speed * time
    arc = []
    # Include the exact apex so coarse samples cannot omit overhead maximum.
    times = sorted({time * i / samples for i in range(samples + 1)} | {apex_time})
    for t in times:
        x, z = speed * t, v * t - g * t * t / 2
        arc.append({"time_s": t, "feet_wu": [x, 0.0, z],
                    "conservative_center_wu": [x, 0.0, z + profile.standing_height / 2],
                    "capsule_top_wu": z + profile.standing_height,
                    "radius_wu": profile.radius})
    return {"status": "UNCALIBRATED ideal estimate; never gameplay certification",
            "profile": asdict(profile), "elevation_wu": elevation,
            "apex_time_s": apex_time, "max_foot_rise_wu": apex,
            "descending_landing_time_s": time, "center_displacement_wu": displacement,
            "ideal_min_runup_wu": speed * speed / (2 * profile.ground_acceleration),
            "runup_note": "Assumes constant acceleration from rest; game runup unverified",
            "launch_center_setback_wu": setback, "landing_center_inset_wu": inset,
            "landing_extra_reserve_wu": landing_reserve, "rise_margin_wu": rise_margin,
            "front_face_extension_wu": front_face_extension,
            "rise_policy_pass": elevation <= apex - rise_margin + 1e-12,
            "max_gap_infinite_platform_wu": displacement - setback - inset - landing_reserve,
            "geometry_note": "Arc uses conservative standing capsule envelope; obstacles, bounds, "
                             "piece collision meshes and effective game movement are unchecked; "
                             "samples are not continuous swept collision proof",
            "unverified": ["Havok timestep and integration", "effective air control and drag",
                           "runtime collision behavior", "gametype trait effects", "in-game calibration"],
            "arc": arc}


def check_gap(gap, platform_width, elevation=0.0, profile=Profile(), **options):
    """Check one straight jump onto a finite platform in the ideal model.

    Target core edge = launch setback + edge-to-edge gap. Width is the usable
    collision-top core extent along +x; visual mesh size is insufficient. Raised
    checks also include the explicit outer-face extension beyond that core edge.
    """
    number("gap", gap, minimum=0)
    number("platform_width", platform_width, positive=True)
    result = estimate(elevation, profile, **options)
    edge = result["launch_center_setback_wu"] + gap
    pad = result["landing_center_inset_wu"] + result["landing_extra_reserve_wu"]
    lo, hi = edge + pad, edge + platform_width - pad
    x = result["center_displacement_wu"]
    time_at_face = (edge - result["front_face_extension_wu"] - profile.radius) / profile.speed
    foot_at_face = (profile.jump_velocity * time_at_face -
                    profile.gravity * time_at_face * time_at_face / 2)
    # A raised block's vertical leading face must be cleared on approach.
    face_pass = elevation <= 0 or (0 <= time_at_face <= result["descending_landing_time_s"]
                                  and foot_at_face >= elevation - 1e-12)
    interval_pass = lo <= hi and lo - 1e-12 <= x <= hi + 1e-12
    failures = []
    if not result["rise_policy_pass"]:
        failures.append("landing height violates the margin below theoretical apex")
    if lo > hi:
        failures.append("platform too narrow for landing insets and reserves")
    elif not interval_pass:
        failures.append("descending contact misses usable landing interval (short or overshoot)")
    if not face_pass:
        failures.append("raised leading face intersects conservative capsule approach")
    result["gap_check"] = {"gap_wu": gap, "platform_width_wu": platform_width,
                           "target_near_edge_x_wu": edge,
                           "target_outer_face_x_wu": edge - result["front_face_extension_wu"],
                           "usable_landing_center_interval_wu": [lo, hi],
                           "leading_face_first_contact_time_s": time_at_face,
                           "foot_height_at_leading_face_wu": foot_at_face,
                           "raised_face_clearance_pass": face_pass,
                           "finite_landing_interval_pass": interval_pass,
                           "ideal_design_policy_pass": not failures,
                           "failures": failures}
    return result


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--elevation", type=float, default=0.0, help="Target top minus launch top (WU)")
    parser.add_argument("--gap", type=float, help="Edge-to-edge gap (WU); requires --platform-width")
    parser.add_argument("--platform-width", type=float, help="Usable target collision top length (WU)")
    for name in ("speed", "gravity", "jump_velocity", "ground_acceleration", "radius", "standing_height"):
        parser.add_argument("--" + name.replace("_", "-"), type=float, default=getattr(Profile(), name))
    for name, default in (("setback", None), ("inset", None), ("landing_reserve", 0.10),
                          ("rise_margin", 0.10), ("front_face_extension", 0.0164)):
        parser.add_argument("--" + name.replace("_", "-"), type=float, default=default)
    parser.add_argument("--samples", type=int, default=24)
    args = vars(parser.parse_args(argv))
    elevation, gap, width = (args.pop(key) for key in ("elevation", "gap", "platform_width"))
    try:
        profile = Profile(**{key: args.pop(key) for key in Profile.__dataclass_fields__})
        if (gap is None) != (width is None):
            raise ValueError("--gap and --platform-width must be supplied together")
        result = estimate(elevation, profile, **args) if gap is None else check_gap(gap, width, elevation, profile, **args)
    except ValueError as error:
        parser.error(str(error))
    print(json.dumps(result, indent=2, allow_nan=False))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
