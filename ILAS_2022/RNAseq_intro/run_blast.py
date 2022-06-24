from Bio.Blast import NCBIWWW
from Bio.Blast import NCBIXML

def run_blast(seq, prog="blastx", db="swissprot"):
  with NCBIWWW.qblast(prog, db, seq) as handle:
    recs = NCBIXML.parse(handle)
    if recs:
      for rec in recs:
        for alignment in rec.alignments:
          for hsp in alignment.hsps:
            return alignment.accession, alignment.hit_def
    else:
      return None, None
