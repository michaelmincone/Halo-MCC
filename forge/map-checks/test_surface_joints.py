"""Exercise the real shell predicates without starting Blender or loading terrain."""
import ast,math,unittest
from pathlib import Path

class Vec:
    def __init__(self,*v):self.v=v
    def __sub__(self,b):return Vec(*(a-c for a,c in zip(self.v,b.v)))
    def dot(self,b):return sum(a*c for a,c in zip(self.v,b.v))
    @property
    def length(self):return math.sqrt(self.dot(self))

class SurfaceJointTests(unittest.TestCase):
    def setUp(self):
        parsed=ast.parse(Path(__file__).with_name('stray_check.py').read_text())
        code=ast.Module(body=[n for n in parsed.body if isinstance(n,ast.FunctionDef)
            and n.name in ('surface_joint','neighbours')],type_ignores=[])
        self.g=dict(mo=[dict(surface_group='sheet',surface_normal_axis=0,section='sheet') for _ in range(2)],
            objs=[dict(type='Wall',index=i) for i in range(2)],
            meshes={'Wall':dict(min=[-.1,-1,-1],max=[.1,1,1])},
            C={0:(Vec(0,0,0),2),1:(Vec(0,1,0),2)},
            normals=[Vec(1,0,0),Vec(1,0,0)],surface_graph={0:set(),1:set()},section=['sheet','sheet'],touch=True)
        self.g['frame']=lambda o:(self.g['normals'][o['index']],Vec(0,1,0),Vec(0,0,1))
        self.g['near']=lambda i,j:self.g['touch']
        exec(compile(ast.fix_missing_locations(code),'<real stray predicates>','exec'),self.g)
    def joint(self):return self.g['surface_joint'](0,1)
    def test_actual_local_contact_accepted(self):self.assertTrue(self.joint())
    def test_disconnected_panels_rejected(self):
        self.g['touch']=False;self.assertFalse(self.joint())
    def test_crossing_planes_rejected(self):
        self.g['normals'][1]=Vec(0,1,0);self.assertFalse(self.joint())
    def test_nonlocal_contact_rejected(self):
        self.g['C'][1]=(Vec(0,4,0),2);self.assertFalse(self.joint())
    def test_wrong_native_normal_axis_rejected(self):
        self.g['mo'][1]['surface_normal_axis']=2;self.assertFalse(self.joint())
    def test_distinct_surfaces_rejected(self):
        self.g['mo'][1]['surface_group']='other';self.assertFalse(self.joint())
    def test_declared_surface_has_no_slot_order_fallback(self):
        self.assertFalse(self.g['neighbours'](0,1))
        self.g['surface_graph'][0].add(1);self.assertTrue(self.g['neighbours'](0,1))
    def test_existing_barrier_line_keeps_ordered_neighbors(self):
        for m in self.g['mo']:m.pop('surface_group')
        self.assertTrue(self.g['neighbours'](0,1))

if __name__=='__main__':unittest.main()
