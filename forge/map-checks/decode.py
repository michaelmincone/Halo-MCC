import sys, json, hashlib
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'Mjolnir-Forge-Editor/Addon'))
sys.dont_write_bytecode=True
from mvarlib import api as P
path=sys.argv[1]; out=sys.argv[2]
data=open(path,'rb').read()
r=P.load_map_variant(data,'x')
print('sha',hashlib.sha256(data).hexdigest())
print('title',r.info.title,'map',r.info.map_name,'occupied',r.info.occupied,'budget',r.info.spent_budget_raw,r.info.max_budget_raw)
print('bounds',r.info.bounds,'hyp',r.info.hypothesis)
objs=[dict(slot=o.slot,type=o.type_name,stock=o.stock,pos=o.position,fwd=o.forward,up=o.up,kind=o.orientation_kind,
           physics=o.physics,label=o.label_index,seq=o.spawn_sequence,shape=o.shape,w=o.width,l=o.length,top=o.top,bot=o.bottom) for o in r.objects]
json.dump(objs,open(out,'w'))
import collections
print(collections.Counter(o['type'] for o in objs))
print('warnings',[w.code for w in r.warnings][:20])
