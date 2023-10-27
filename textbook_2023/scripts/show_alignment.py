import sys
ref    = sys.argv[1] # ref-fasta
sample = sys.argv[2] # bam

## ---- 以下、変更不要 -----
import igv_notebook
from tools.igv_prep import RefTrack, AnnotationTrack, BamTrack
bam_common_info = { "displayMode":"SQUISHED", "viewAsPairs":True, "height":100, "showCoverage":False }
igv_notebook.init()
ref = RefTrack({ "fastaPath": ref, "indexPath": ref+".fai", "id": ref })
bam = BamTrack({ "name": sample, "path": sample, "viewAsPairs":True })
b = igv_notebook.Browser(ref)
b.load_track(bam)