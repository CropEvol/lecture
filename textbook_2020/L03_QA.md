# ご質問・ご意見への回答
---

[ご質問またはご意見]

提出した課題は内容まで確認して頂いているのでしょうか。自分の回答と模範解答とでコードが異なるとき、合っているのか分からないので不安です。

[回答]

1件1件、確認しています。

もし、確認時のコメントを受け取りたい方は、共有URLリンク発行時に「閲覧（コメント可）」の設定にしてください。また、PandAでの課題提出時に「確認コメントを残してほしい」等の旨を書き添えていただけると非常に助かります。

<img src="https://lh3.googleusercontent.com/pw/ACtC-3ewzx4Gy9Z_hgGuTD_8ofSK1UZWfjuKE-99L1hQMBRjOetydxDY4Gh16xbFSWg3CWnbLUgN7I65XZQiQ8AobIteQ6axcFicu2ArJU3ZJZMBOCvUoppNQF2Tpsv2p9JXCt9vYZP4KPI5vvz_MhKGddPg=w1523-h1021-no?authuser=0" alt="read_line" height="200px">

---

[ご質問またはご意見]

今回はテキストファイルの全ての行についての操作を行っていましたが、どれか特定の行や特定の範囲に入る行に対して何かの処理を行う場合もあるのでしょうか。

[回答]

あります。

実習中には説明しませんでしたが、if構文という条件分岐構文を使うと、ある条件に合う行（特定の文字や数字が含む行）のみを処理することや3行目から5行目のみを処理するなど、より複雑な処理をおこなうことが可能です。実際のゲノム解析でも、特定の行データのみを取り出す作業（**フィルタリング**作業と言う）はよくおこないます。

後日の「Pythonライブラリを使う - pandas -」で、条件に合う行のみを取り出す方法を学びます。

---

[ご質問またはご意見]

①なぜ

```python
for i in "ATAGAATTCT":
  print(i)
```
というプログラムを動作させたら、
```
A
T
A
G
A
A
T
T
C
T
```
のように、文字が1つごとにprintされるが、

```python
f = open("allele_count_mini2.txt")
for line in f:
  print(line)
```

というプログラムを動作させたら、

```
chr1 61 G . 57 0
chr1 62 G . 57 0
chr1 63 T C 21 36
chr1 64 C . 55 0
chr1 65 T . 58 0
chr1 66 G . 58 0
chr1 67 C G 22 38
chr1 68 A . 61 0
chr1 69 T . 62 0
chr1 70 T . 63 0
```

のように、文字が1行ごとにprintされるようになるのでしょうか。

[回答]

for構文の基本構造は下記です。

```python
for 変数 in 繰り返し処理をしたいデータ:
	処理1
	処理2
	処理3
	 :
```

`繰り返し処理をしたいデータ`に何を入れるかで、for構文で取り出される単位が異なってきます。

- 文字列の場合、先頭文字から1文字ずつ取り出されます
- テキストファイルの場合（`open()`で開いたデータの場合）、先頭の行から1行ずつ取り出されます。
- リストデータの場合、先頭の要素から1要素ずつ取り出されます。

---

[ご質問またはご意見]

質問ですが、前回for関数の際に変数はiで設定して、今回はlineに設定しただけでしょうか．
また、for関数は1行に並べるという機能しか持ってないのでしょうか。

[回答]

前者の回答は、Yesです。`for 変数 in <繰り返し処理をおこないたいデータ>:`の 変数は自由に名前を設定できます。他の変数名でもOKです。

後者への回答ですが、for構文は`<繰り返し処理をおこないたいデータ>`から一つずつ情報を取り出す機能を持っています。

使い道は、ファイルを1行ずつ読み込むだけではありません。文字列を1文字ずつ取り出したり、リストから1要素ずつ取り出すなど、`<繰り返し処理をおこないたいデータ>`に何を入れるかによって、ループ時に取り出されるデータも異なってきます。

---

[ご質問またはご意見]

`print(line, line[4], line[5])`と `print(line,line[4:6])`の意味が同じのように思いますが、なぜ出力は違うのでしょうか。

[回答]

リストから情報を取り出す際、インデックスを指定すると（`line[4]`や`line[5])`）、それぞれの要素にアクセスすることになります。実習例の場合、それぞれの要素には"文字列"が入るため、インデックス指定で文字列が取り出されます。

リストのスライスを指定すると（`line[4:6]`とすると）、リストから"リストの一部"を切り抜くことになります。切り抜かれた情報は、元と同じデータ型（リスト）として取り出されます。

- インデックス指定は、ここの要素にアクセスする
- スライスは、一部を切り抜く

[サンプルプログラム1](https://colab.research.google.com/github/CropEvol/lecture/blob/master/textbook_2020/L03_QA.ipynb)

---

[ご質問またはご意見]

複数の要素を取り出すときに、`print(line, line[4], line[5])`とするべきところを、`print(line, line[4, 5])`としてしまいエラーとなったのですが、複数の要素を取り出す方法は、この「`print(line, line[4], line[5])`」という１通りなのか疑問に思いました。

[回答]

スライスを使って、複数の要素を範囲指定して取り出す方法はあります。しかし、取り出される結果はリストデータです。

```python
print(line[4:6]) # 4番目と5番目の要素が取り出される
                 # 出力結果 [<4番目要素>, <5番目要素>]
```

[サンプルプログラム2](https://colab.research.google.com/github/CropEvol/lecture/blob/master/textbook_2020/L03_QA.ipynb)

---

[ご質問またはご意見]

ファイルを開いた最後に書き込む　f.close()　の文の意味が良く解りませんでした。実際この文字列を抜いて実行してみても抜く前と結果が変わらなかったでした。一体この「close」の文字はどのような働きをしているのでしょうか。

[回答]

```python
f = open("<ファイル名>")
f.close()
```

`ファイル変数.close()`で、ファイル変数に一時的に保持している情報を捨てています（ただし、完全に初期化されるわけではありません）。なぜ`ファイル変数.close()`でファイル変数の情報を捨てるかというと、ファイル変数が使っているメモリ領域を解放させるためです。

例え話で説明すると、次のようなイメージです。作業机を想定してください。`ファイル変数 = open(<ファイル>)`は「机の上にノートを広げる」に相当します。`close()`は「ノートを閉じて、そのノートを机の隅やファイル立てに置く」です（`close()`でファイル変数自体がなくなるわけではないので、机の上のどこかにノートが残った状態です）。ノートを広げながら他の作業をおこなえるかもしれませんが、作業が終わったノートをそのまま放置しておくのは邪魔なだけです。作業が終わったノートは片付ける方が良いでしょう。

<small>※ `close()`を書かなくても、Python自体が勝手にどこかのタイミングで`close()`操作をおこなうようですが、明示的に付けるのが良い習慣でしょう。</small>

---

[ご質問またはご意見]

私のパソコンにもpyhonの環境を入れてみましたが、出力がcolaboratoryの場合と時々違うので不思議に感じています。具体的には、print("abc", "def")の出力が('abc', 'def')となります。調べてみるとpythonのバージョンの違いによるものかと思いますが、この場合はリスト（タプル？）として出力されているのでしょうか？

[回答]

インストールされたPythonのバージョンは2（Python2）ではないでしょうか？

今回勉強しているPythonのバージョンは3（Python3）です。

Python2の`print`関数の書き方は、Python3と異なります。Python2の`print`関数は丸括弧`()`を使いません。Python3で、print関数に`()`が必要です。

```python
# Python3の書き方
print("abc", "def")  # 出力結果: abc def
```

```python
# Python2
# 上と同じ出力をおこなう書き方
print "abc", "def" # 出力結果: abc def

# 構文は間違っていないが、以下は違った出力になる
# これは、タプル（リストみたいなデータ型）がprint関数に与えられているため
print("abc", "def")   # 出力結果: ('abc', 'def')
print  ("abc", "def") # 出力結果: ('abc', 'def')

# ついでに、リストをprint関数に与えた場合
print["abc", "def"]   # 出力結果: ['abc', 'def']
print  ["abc", "def"] # 出力結果: ['abc', 'def']
```