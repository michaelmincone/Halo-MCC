"""Regression controls for real copies versus touching short road panels."""
import math,unittest
from duplicate_check import near_duplicate_offset


class DuplicateTests(unittest.TestCase):
    axes=((1,0,0),(0,1,0),(0,0,1))
    lo=(-.5,-2.5,-.111)
    hi=(.5,2.5,.111)

    def test_exact_copy(self):
        self.assertTrue(near_duplicate_offset((0,0,0),self.axes,self.lo,self.hi))

    def test_small_displaced_copy(self):
        self.assertTrue(near_duplicate_offset((.1,.1,.01),self.axes,self.lo,self.hi))

    def test_end_to_end_strips_are_distinct(self):
        self.assertFalse(near_duplicate_offset((.85,0,0),self.axes,self.lo,self.hi))

    def test_separate_faces_are_distinct(self):
        self.assertFalse(near_duplicate_offset((0,0,.15),self.axes,self.lo,self.hi))

    def test_rotated_travel_axis(self):
        a=math.radians(63);axes=((math.cos(a),0,math.sin(a)),(0,1,0),(-math.sin(a),0,math.cos(a)))
        self.assertFalse(near_duplicate_offset(tuple(.85*v for v in axes[0]),axes,self.lo,self.hi))
        self.assertTrue(near_duplicate_offset(tuple(.1*v for v in axes[0]),axes,self.lo,self.hi))


if __name__=='__main__':unittest.main()
