# Unix入門 [練習問題 解答]

## Problem 1
(1) `seqdir` または `./seqdir`

(2) `../../lsdir/abc01.csv`

## Problem 2
`cat seq_*.fasta > seq_merge.fasta`

　上記コマンド `cat seq_*.fasta` は、 `*` (アスタリスク)をつけることで、「 `seq_`から始まり、間に何らかの文字があり、`.fasta`で終わるファイルに対し、 `cat` コマンドを使う」の意味になります。  
　今回の場合、 `cat` コマンドの対象は、 `*.fasta` 等でも構いません。

## Problem 3
`grep '>' seq_merge.fasta`

## Problem 4
`python count_ATGCN.py ../seqdir/randseq1.fasta `
