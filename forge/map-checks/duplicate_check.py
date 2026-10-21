"""Native-size duplicate proximity test, independent of Blender.

An almost identical orientation is checked by the caller, as is actual mesh
intersection. Compare each native dimension; a strip's width cannot be used
as the duplicate tolerance along its much shorter travel dimension.
"""


def near_duplicate_offset(delta, axes, minimum, maximum, ratio=0.35):
    return all(abs(sum(d*a for d,a in zip(delta,axis))) < ratio * max(1e-6,hi-lo)
               for axis,lo,hi in zip(axes,minimum,maximum))
