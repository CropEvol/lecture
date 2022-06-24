from Bio.Blast import NCBIWWW
from Bio.Blast import NCBIXML

def run_blast(prog, db, seq):
  with NCBIWWW.qblast(program=prog, database=db, sequence=seq) as handle:
    recs = NCBIXML.parse(handle)
    for rec in recs:
      for alignment in rec.alignments:
        for hsp in alignment.hsps:
          return alignment.accession, alignment.hit_def