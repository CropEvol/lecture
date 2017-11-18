# Unix入門 [練習問題]

　課題用のデータは以下のURLにあります。ダウンロードしてください（__講義で使用したL08_samples.zipと同じです__）。  
　[https://github.com/CropEvol/lecture/raw/master/data/L08_samples.zip](https://github.com/CropEvol/lecture/raw/master/data/L08_samples.zip)

## Problem 1
(1) `L08_samples` から見た `L08_samples/seqdir` の相対パスを答えてください。  
(2) `L08_samples/cddir/dir1` から見た `L08_samples/lsdir/abc01.csv` の相対パスを答えてください。

## Problem 2
　`L08_samples/seqdir` に移動してください。移動後、Unixコマンドを使って、`P08_sequence01.fasta`、`P08_sequence02.fasta`、`P08_sequence03.fasta`の中身を、1つの新規ファイルに書き出してください。解答として、そのときのUnixコマンドを提出してください（`L08_samples/seqdir` への移動コマンドは解答不要）。

[ヒント] `cat`を使う

## Problem 3
　Problem 2でまとめたFASTAファイルの配列名の行のみを抽出してください。解答として、そのときのUnixコマンドを提出してください。

[ヒント] `grep`を使う

## Problem 4
　`L08_samples/manydir` に移動してください。移動後、`manydir/count_ATGCN.py` を `L08_samples/seqdir/randseq1.fasta` に対して実行してください。解答として、そのときのUnixコマンドを提出してください（`L08_samples/manydir` への移動コマンドは解答不要）。

[ヒント] 相対パスを使う  
[count_ATGCN.py の使い方] `python count_ATGCN.py [FASTAファイル]`  
