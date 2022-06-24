from Bio.Blast import NCBIWWW
from Bio.Blast import NCBIXML

def run_blast(seq, prog="blastx", db="swissprot"):
  # BLAST検索を実行
  handle = NCBIWWW.qblast(prog, db, seq)
  # 検索結果の読み込み
  recs = NCBIXML.parse(handle)
  for rec in recs:
    # 検索結果1以上のとき、ベストスコアの結果のみ取得
    for alignment in rec.alignments:
      for hsp in alignment.hsps:
        return alignment.accession, alignment.hit_def
    # 検索結果0のとき
    return None, None