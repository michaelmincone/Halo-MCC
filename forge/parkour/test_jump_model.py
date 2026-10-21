"""Mathematical contract tests, not Reach gameplay calibration."""
import contextlib
import io
import json
import math
import unittest

from jump_model import Profile, check_gap, estimate, main


class JumpModelTests(unittest.TestCase):
    def test_equal_height_and_insets(self):
        p = Profile()
        result = estimate()
        self.assertAlmostEqual(result["descending_landing_time_s"], 2 * p.jump_velocity / p.gravity)
        self.assertAlmostEqual(result["max_foot_rise_wu"], p.jump_velocity**2 / (2 * p.gravity))
        self.assertAlmostEqual(result["max_gap_infinite_platform_wu"],
                               result["center_displacement_wu"] - 2 * (p.radius + .1) - .1)
        self.assertAlmostEqual(result["ideal_min_runup_wu"], p.speed**2 / (2 * p.ground_acceleration))
        self.assertAlmostEqual(result["arc"][-1]["feet_wu"][2], 0)
        self.assertAlmostEqual(result["arc"][0]["capsule_top_wu"], p.standing_height)
        coarse = estimate(-.5, samples=3)
        apex_sample = [point for point in coarse["arc"] if point["time_s"] == coarse["apex_time_s"]]
        self.assertEqual(len(apex_sample), 1)
        self.assertAlmostEqual(apex_sample[0]["feet_wu"][2], coarse["max_foot_rise_wu"])
        self.assertEqual(coarse["arc"][0]["time_s"], 0)
        self.assertEqual(coarse["arc"][-1]["time_s"], coarse["descending_landing_time_s"])

    def test_descending_roots_above_and_below(self):
        p = Profile()
        for dz in (-1.0, 0.0, .3):
            t = estimate(dz)["descending_landing_time_s"]
            self.assertAlmostEqual(p.jump_velocity * t - p.gravity * t*t/2, dz)
            self.assertLessEqual(p.jump_velocity - p.gravity * t, 0)

    def test_unreachable_and_apex_margin(self):
        apex = estimate()["max_foot_rise_wu"]
        with self.assertRaises(ValueError):
            estimate(apex + .01)
        self.assertFalse(estimate(apex - .05)["rise_policy_pass"])
        self.assertTrue(estimate(apex - .11)["rise_policy_pass"])

    def test_raised_face_blocks_short_gap_even_if_landing_fits(self):
        result = check_gap(.0, 3.0, .3)
        self.assertTrue(result["gap_check"]["finite_landing_interval_pass"])
        self.assertFalse(result["gap_check"]["raised_face_clearance_pass"])
        self.assertFalse(result["gap_check"]["ideal_design_policy_pass"])
        self.assertTrue(check_gap(1.0, 2.0, .3)["gap_check"]["ideal_design_policy_pass"])

    def test_outer_face_extension_rejects_core_only_boundary(self):
        p, dz = Profile(), .3
        ascending_time = (p.jump_velocity - math.sqrt(p.jump_velocity**2 - 2*p.gravity*dz)) / p.gravity
        gap = p.speed * ascending_time - .1 + .0082
        core_only = check_gap(gap, 3.0, dz, front_face_extension=0)
        outer_face = check_gap(gap, 3.0, dz)
        self.assertTrue(core_only["gap_check"]["ideal_design_policy_pass"])
        self.assertFalse(outer_face["gap_check"]["raised_face_clearance_pass"])
        self.assertAlmostEqual(outer_face["gap_check"]["leading_face_first_contact_time_s"],
                               core_only["gap_check"]["leading_face_first_contact_time_s"] - .0164/p.speed)

    def test_finite_platform_can_be_overshot(self):
        maximum = estimate()["max_gap_infinite_platform_wu"]
        self.assertTrue(check_gap(maximum, 1.0)["gap_check"]["ideal_design_policy_pass"])
        self.assertFalse(check_gap(.1, 1.0)["gap_check"]["ideal_design_policy_pass"])
        self.assertFalse(check_gap(maximum + .01, 1.0)["gap_check"]["finite_landing_interval_pass"])
        self.assertFalse(check_gap(1.5, .5)["gap_check"]["ideal_design_policy_pass"])

    def test_invalid_and_nonfinite_values(self):
        for invalid in (math.nan, math.inf, -math.inf, True):
            with self.assertRaises(ValueError):
                estimate(invalid)
            with self.assertRaises(ValueError):
                Profile(speed=invalid)
        for kwargs in ({"samples": 1}, {"samples": 2.5}, {"inset": .1}, {"rise_margin": -1},
                       {"front_face_extension": -1}):
            with self.assertRaises(ValueError):
                estimate(**kwargs)
        with self.assertRaises(ValueError):
            check_gap(-.1, 1)
        with self.assertRaises(ValueError):
            check_gap(1, 0)

    def test_cli_matches_api(self):
        output = io.StringIO()
        with contextlib.redirect_stdout(output):
            self.assertEqual(main(["--gap", "1.5", "--platform-width", "1", "--samples", "2"]), 0)
        result = json.loads(output.getvalue())
        self.assertEqual(result, check_gap(1.5, 1, samples=2))
        self.assertIn("UNCALIBRATED", result["status"])
        with contextlib.redirect_stderr(io.StringIO()), self.assertRaises(SystemExit) as error:
            main(["--gap", "1"])
        self.assertEqual(error.exception.code, 2)
        with contextlib.redirect_stdout(io.StringIO()) as failed_output:
            self.assertEqual(main(["--gap", "0.1", "--platform-width", "1"]), 0)
        self.assertFalse(json.loads(failed_output.getvalue())["gap_check"]["ideal_design_policy_pass"])
        with contextlib.redirect_stderr(io.StringIO()), self.assertRaises(SystemExit) as error:
            main(["--gravity", "0"])
        self.assertEqual(error.exception.code, 2)


if __name__ == "__main__":
    unittest.main()
