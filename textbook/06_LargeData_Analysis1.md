# 大規模データ解析入門1

## Pythonを使ったテキストファイル処理
　ゲノム解析を含め、大規模データ（ビッグデータ）の多くはテキストファイルです。すなわち、テキストエディタで中身を見ることができます（ただし、データサイズが大きい場合、テキストエディタでは読み込めません）。 ここでは、Pythonで大規模データを取り扱う練習をしてみましょう。

### 取り扱うデータ
　今回使うデータは塩基配列（DNA配列）です。塩基配列の記述様式はいくつかありますが、もっともよく使われる様式は __FASTA形式__ です。

```
>sequence_1
GGCAGGTATTGCTGGGAAGCTGTAAGATGANAATAGTTGGGTTCAGTCAGCACAATATGTTACGGTAGGATCGCGAGGTT
>sequence_2
GCCGAGTTTAATTGCAATCAATTAGAAGAATAAAGAAGAATTACTGCATTTCATAACTGATTTTTTTCTCTTTTTATTTC
>sequence_3
GCCGCCCTGGCCGTAGCCGCCACCTCCCTGGCCGCCGTAGCCACCGCCGCCGCCGCCGTAGCCGCCGCCACCGCCGCGCT
```

　`>`で始まる行は配列名です。上の例では`sequence_1`、`sequence_2`、`sequence_3`が配列名です。そして、配列名に対応する塩基配列（例では80塩基）がすぐ下の行に書かれています。  
　なお、塩基配列は、A,T,C,G,Nの5つの文字で表されています。

    A: アデニン  
    T: チミン  
    C: シトシン  
    G: グアニン  
    N: 不明な塩基  

　今回は、大規模データ処理の基本を学ぶために、次のような配列データのファイルを使うことにします。まずは10個の塩基配列（10行）のデータを使いましょう。配列名と配列本体が **タブ** と呼ばれるスペースのようなもので分けられています。このようなテキストデータは **タブ区切りテキスト** と呼ばれています。  

```
sequence_1	GGCAGGTATTGCTGGGAAGCTGTAAGATGANAATAGTTGGGTTCAGTCAGCACAATATGTTACGGTAGGATCGCGAGGTT
sequence_2	GCCGAGTTTAATTGCAATCAATTAGAAGAATAAAGAAGAATTACTGCATTTCATAACTGATTTTTTTCTCTTTTTATTTC
sequence_3	GCCGCCCTGGCCGTAGCCGCCACCTCCCTGGCCGCCGTAGCCACCGCCGCCGCCGCCGTAGCCGCCGCCACCGCCGCGCT
sequence_4	ACCAACTTCGCCCCCGGAAGCTAAATGTGTTTAGCCGTCCGTCCGTCCGTCCATCGGACGAGATATGCATGTGTACTTGT
sequence_5	ATGGATATTCAGGAAACGGGGTGTGGCGGTTTGGTGAGTTCTGGGGACCAAAAGAGAAGAGTTCCATATCGACATGGCTC
sequence_6	CCGCCAAATTGTAATACAGAATCGTCCCCAAAGATTTCGGNCAGAGCTGGCATATGCCAAACATGAATACCACCTGAAGC
sequence_7	AAGNAAGGCTGAACNNGNNAGGTTCTGTGATNCCCTTNTCTCCATCAGNGANGNNNTTGCAGAGGTAGAAAATGGCAAAG
sequence_8	TTTTTTTTTTTTTTTTTTTTCCNTNCANNNNNANNTNNTTNNNTNNTNTTTNGGNAGTNNNGGANNNNNTNCNTTNNGTN
sequence_9	GTAGCTTCAGGTGTATTCATGTTTGGCATATGCCAGCTCTGACCGAAATCTTTGGGGACGATTCTGTATTACAATTTGGT
sequence_10	AAAGCATTGCGTATGTCTGGGGGAGATCATATCCACTCCGGTACAGTAGTAGGTAAGTTAGAAGGGGAACGCGAAATGAC

```

　上のデータをコピーし、テキストエディタ（Windowsの場合「サクラエディタ」、Macの場合「mi」など）ペーストしてください。そして、ファイルを`L06_10sequences.txt`といった名前で保存してください（他の名前でも構いませんが、 __必ず半角英数__ にしてください）。

　もしくは、下記をJupyter Notebookのどこかのセルに貼り付けて、実行してください。 演習のサンプルデータ `L06_10sequences.txt` がダウンロードされます。

```
%%bash
wget https://raw.githubusercontent.com/CropEvol/lecture/master/data/L06_10sequences.txt --no-check-certificate
```

---

### 演習

　この10個の塩基配列のうち、「N（不明な塩基）が10%以上の割合で含まれる配列とそうでない配列を分ける」プログラムを作っていきましょう。  
　ポイントは次の8つです（[イメージ図](./06_Flow.pdf)）。
　
1. [ファイルを開く、閉じる](#section1)
2. [一行ずつ処理する](#section2)
3. ["タブ区切り"を認識して、配列名と配列本体を分ける](#section3)
4. [改行コードを取り除く](#section4)
5. [配列の長さを調べる](#section5)
6. [配列内のNの数を調べる](#section6)
7. [条件にしたがって配列を振り分ける](#section7)
8. [結果をファイルに出力](#section8)

<a name="section1"></a>
#### 1. ファイルを開く、閉じる
　まず、`L06_10sequences.txt`のファイルを開きます。

```python
f = open('L06_10sequences.txt', 'r')       # ファイルを開く
f.close()                           # ファイルを閉じる

######## メモ ########
# ----------------------
# open(ファイル名, r,wなど)
# ----------------------
# ファイルを開く関数
# 第一引数にファイル名
# 第二引数に読み込み形式
# 'r': 読み込み用に開く。ファイルが存在しない場合はエラー。
# 'w': 書き込み用に開く。
#      ファイルが存在する場合は上書き。
#      ファイルが存在しない場合には新規作成。
# 'a': 書き込み用に開く。
#      ファイルが存在する場合は追加書き込み。
#      ファイルが存在しない場合には新規作成。
#
# ----------------------
# close()
# ----------------------
# ファイルを閉じる関数
# open()で指定した変数名を前につける
# 引数はなし
```

<a name="section2"></a>
#### 2. 一行ずつ処理する
　開いたファイルを一行目から一行ずつ読み込む文を書きます。繰り返し処理でよく使うfor文を加えます。

```python
f = open('L06_10sequences.txt', 'r')       # ファイルを開く
for line in f:                      # 一行ずつ読み込む
    print(line)                     # 表示
f.close()                           # ファイルを閉じる

######## メモ ########
# ----------------------
# for 変数 in 繰り返し対象:
#     (処理1)
#     (処理2)
# ----------------------
# 繰り返し処理を行う文
# for文中の処理であることを示すにはインデント（字下げ）が必要です。

# ----------------------
# print(表示したい文字列、数字、変数など)
# ----------------------
# 表示する関数
```

　一行毎に空白行が追加されてしまっています。これは、各行の終わりに改行文字（`\n`; Windowsの場合 `¥n`）と呼ばれる特殊な文字が含まれており、さらにprint文によりその改行文字が新たに追加されているためです。この改行文字については、もう少し後で処理します。  

<div style="page-break-before:always"></div>

<a name="section3"></a>
#### 3. "タブ区切り"を認識して、配列名と配列本体を分ける
　先に、配列名と配列本体を分けるコードを書いてみましょう。配列名と配列本体の間にはタブ文字(`\t`; Windowsの場合 `¥t`）があります。そのタブ文字で区切れば、配列名と配列本体を分けることができます。

```python
f = open('L06_10sequences.txt', 'r')       # ファイルを開く
for line in f:                      # 一行ずつ読み込む
    item = line.split('\t')         # 文字列をタブ文字で分割する

    #print(line)                     # 表示
    print(item)

f.close()                           # ファイルを閉じる

######## メモ ########
# ----------------------
# 変数 = 文字列.split('\t')
# ----------------------
# split()は、引数に区切り文字を指定し、文字列を分割する関数
#   '\t': タブ文字（Windowsの場合: '¥t'）
# 左の変数には区切り文字で分割されたリストが入る
#
# 他によく使われる区切り文字: ','(カンマ)
```

<a name="section4"></a>
#### 4. 改行コードを取り除く
　うまく配列名と配列本体を分けることができました。しかし、配列の後ろに改行文字（`\n`または`¥n`）が付いた状態です。  
　今度は、その改行文字を除きましょう。

```python
f = open('L06_10sequences.txt', 'r')       # ファイルを開く
for line in f:                      # 一行ずつ読み込む
    line = line[:-1]                # 改行文字を取り除く
    item = line.split('\t')         # 文字列をタブ文字で分割する

    #print(line)                     # 表示
    print(item)

f.close()                           # ファイルを閉じる

######## メモ ########
# ----------------------
# 文字列[:-1]
# ----------------------
# 文字列の一番後ろを除きます。
# "-1"は文字列の一番後ろの文字を表す数字です。
#
# ----------------------
# line = line[:-1]
# item = line.split('\t')  の解説
# ----------------------
# 変数lineに入っている文字列の一番後ろの文字（ここでは改行文字）を取り除き、
# 変数lineを上書きしています。
# 改行文字を除いた文字列を.split('\t') を使ってタブ文字で区切っています。
# その結果を 変数item にリストの形で格納しています。
#
# この2行は次のように1行にまとめることができます。
# item = line[:-1].split('\t')
#
# ----------------------
# 「タブ区切りファイルの読み込み」のひな形
# ----------------------
# f = open(タブ区切りテキストファイル, 'r')
# for line in f:
#   item = line[:-1].split('\t')
# f.close()
#
# ----------------------
# 改行文字の取り除く別の方法
# ----------------------
# line = line.strip()
```

　現在、各行はリストに格納されています。このうち、配列本体だけを取り出しましょう。

```python
f = open('L06_10sequences.txt', 'r')       # ファイルを開く
for line in f:                      # 一行ずつ読み込む
    line = line[:-1]                # 改行文字を取り除く
    item = line.split('\t')         # 文字列をタブ文字で分割する
    name = item[0]                  # 配列名を取り出す
    seq  = item[1]                  # 配列本体を取り出す

    #print(line)                     # 表示
    #print(item)
    print(seq)

f.close()                           # ファイルを閉じる

######## メモ ########
# ----------------------
# リスト[インデックス]
# ----------------------
# リスト内の要素にアクセスする。
#
# 今回の場合、
# 配列名にアクセスしたい場合 -> item[0]
# 配列本体にアクセスしたい場合 -> item[1]
# 注意: インデックス番号は0からスタートします。
#
# abcd = ['a', 'b', 'c', 'd']というリストの場合、
#   abcd[0]（または abcd[-4]） -> 'a'
#   abcd[1]（または abcd[-3]） -> 'b'
#   abcd[2]（または abcd[-2]） -> 'c'
#   abcd[3]（または abcd[-1]） -> 'd'
```

<a name="section5"></a>
#### 5. 配列の長さを調べる
　うまく各行の塩基配列を取り出せたので、各行の配列の長さを取得してみましょう。

```python
f = open('L06_10sequences.txt', 'r')       # ファイルを開く
for line in f:                      # 一行ずつ読み込む
    line = line[:-1]                # 改行文字を取り除く
    item = line.split('\t')         # 文字列をタブ文字で分割する
    name = item[0]                  # 配列名を取り出す
    seq  = item[1]                  # 配列本体を取り出す
    seq_size = len(seq)             # 塩基配列の長さを取得

    #print(line)                     # 表示
    #print(item)
    print(seq, seq_size)

f.close()                           # ファイルを閉じる

######## メモ ########
# ----------------------
# len(文字列)
# ----------------------
# 文字列などの長さを調べる関数
```

<a name="section6"></a>
#### 6. 配列内のNの数を調べる
　次に、ひとつの塩基配列内に何個のN（不明な塩基）が含まれているかカウントします。

```python
f = open('L06_10sequences.txt', 'r')       # ファイルを開く
for line in f:                      # 一行ずつ読み込む
    line = line[:-1]                # 改行文字を取り除く
    item = line.split('\t')         # 文字列をタブ文字で分割する
    name = item[0]                  # 配列名を取り出す
    seq  = item[1]                  # 配列本体を取り出す
    seq_size = len(seq)             # 塩基配列の長さを取得
    N_num = seq.count('N')          # Nの数を取得

    #print(line)                     # 表示
    #print(item)
    print(seq, seq_size, N_num)

f.close()                           # ファイルを閉じる

######## メモ ########
# ----------------------
# 文字列.count(調べたい文字など)
# ----------------------
# 文字列の中に「調べたい文字」が何個含まれるか数える関数
```

　このプログラムで実行したいことは「N（不明な塩基）が10%以上の割合で含まれる配列とそうでない配列を分ける」です。ひとつの塩基配列中のN含有率を計算しましょう。

```python
f = open('L06_10sequences.txt', 'r')       # ファイルを開く
for line in f:                      # 一行ずつ読み込む
    line = line[:-1]                # 改行文字を取り除く
    item = line.split('\t')         # 文字列をタブ文字で分割する
    name = item[0]                  # 配列名を取り出す
    seq  = item[1]                  # 配列本体を取り出す
    seq_size = len(seq)             # 塩基配列の長さを取得
    N_num = seq.count('N')          # Nの数を取得
    N_perc = N_num/seq_size         # N含有率を計算

    #print(line)                     # 表示
    #print(item)
    print(seq, seq_size, N_num)
    print(N_perc)

f.close()                           # ファイルを閉じる
```

<a name="section7"></a>
#### 7. 条件にしたがって配列を振り分ける
　if文を使って、N含有率10%以上の配列のみ表示しましょう。ついでに、配列名も表示しましょう。

```python
f = open('L06_10sequences.txt', 'r')       # ファイルを開く
for line in f:                      # 一行ずつ読み込む
    line = line[:-1]                # 改行文字を取り除く
    item = line.split('\t')         # 文字列をタブ文字で分割する
    name = item[0]                  # 配列名を取り出す
    seq  = item[1]                  # 配列本体を取り出す
    seq_size = len(seq)             # 塩基配列の長さを取得
    N_num = seq.count('N')          # Nの数を取得
    N_perc = N_num/seq_size         # N含有率を計算

    if N_perc >= 0.10:              # N含有率10%以上の場合
        print(name, seq)

    #print(line)                     # 表示
    #print(item)
    #print(seq, seq_size, N_num)
    #print(N_perc)

f.close()                           # ファイルを閉じる

######## メモ ########
# ----------------------
# if 条件式:
#     (処理1)
#     (処理2)
#     ...
# ----------------------
# 条件に合う場合のみ処理を行う。
# if文内の処理であることを示すためにはインデントが必要
```

　N含有率10%未満のデータも表示しましょう。if-else文にします。ここで、if内とelse内の動作を同じにしてしまったら、if-else文を書いている意味がないので、N含有率10%以上のときに`bad`、そうでないときに`good`と表示しましょう。

```python
f = open('L06_10sequences.txt', 'r')       # ファイルを開く
for line in f:                      # 一行ずつ読み込む
    line = line[:-1]                # 改行文字を取り除く
    item = line.split('\t')         # 文字列をタブ文字で分割する
    name = item[0]                  # 配列名を取り出す
    seq  = item[1]                  # 配列本体を取り出す
    seq_size = len(seq)             # 塩基配列の長さを取得
    N_num = seq.count('N')          # Nの数を取得
    N_perc = N_num/seq_size         # N含有率を計算

    if N_perc >= 0.10:              # N含有率10%以上の場合
        print(name, seq, 'bad')

    else:                           # N含有率10%未満の場合
        print(name, seq, 'good')

    #print(line)                     # 表示
    #print(item)
    #print(seq, seq_size, N_num)
    #print(N_perc)

f.close()                           # ファイルを閉じる

######## メモ ########
# ----------------------
# if 条件式:
#     (if内の処理1)
#     (if内の処理2)
#     ...
# else:
#     (else内の処理1)
#     (else内の処理2)
#     ...
# ----------------------
# 条件に合う場合と合わない場合の処理を分ける。
```

<a name="section8"></a>
#### 8. 結果をファイルに出力
　これでファイル内のすべての配列を処理するプログラムはできましたが、せっかくなので、N含有率10%以上と10%未満の配列を別々のファイルに書き出しましょう（タブ区切りファイルとして書き出しましょう）。  
　出力ファイルを作成には`open()`の`'w'（書き込みモード）`を使います。  
　ファイルに書き込む関数には`write()`を使います。

```python
f = open('L06_10sequences.txt', 'r')       # ファイルを開く
GOOD = open('L06_10sequences_good.txt', 'w')     # 出力ファイル1を開く
BAD = open('L06_10sequences_bad.txt', 'w')     # 出力ファイル2を開く

for line in f:                      # 一行ずつ読み込む
    line = line[:-1]                # 改行文字を取り除く
    item = line.split('\t')         # 文字列をタブ文字で分割する
    name = item[0]                  # 配列名を取り出す
    seq  = item[1]                  # 配列本体を取り出す
    seq_size = len(seq)             # 塩基配列の長さを取得
    N_num = seq.count('N')          # Nの数を取得
    N_perc = N_num/seq_size         # N含有率を計算

    if N_perc >= 0.10:              # N含有率10%以上の場合
        print(name, seq, 'bad')
        BAD.write(name + '\t' + seq + '\n')    # 出力ファイル1に書き込む

    else:                           # N含有率10%未満の場合
        print(name, seq, 'good')
        GOOD.write(name + '\t' + seq + '\n')    # 出力ファイル2に書き込む

    #print(line)                     # 表示
    #print(item)
    #print(seq, seq_size, N_num)
    #print(N_perc)

f.close()                           # ファイルを閉じる
GOOD.close()
BAD.close()

######## メモ ########
# ----------------------
# ファイル変数名.write(出力したい文字列など)
# ----------------------
# ファイルに出力する関数

# ----------------------
# 文字列 + 文字列
# ----------------------
# 文字列の結合
#
# 例えば、'ABC' + 'DEF'とした場合、
# 2つの文字列が結合し、'ABCDEF'という文字列になります。
#
# 上のプログラムの name + '\t' + seq + '\n' は、
# タブ区切りファイルとして出力するために、
# 配列名と配列の間にタブ文字を入れてます。
#
#   配列名 + タブ文字('\t') + 配列 + 改行文字('\n')
#
# なお、以下のようにしても同じ出力結果が得られます。
# BAD.write(line + '\n')
# GOOD.write(line + '\n')
```

　これで、「N（不明な塩基）が10%以上の割合で含まれる配列とそうでない配列を分ける」プログラムの完成です。  

　より大規模なデータも用意しています。同様に、上で作ったプログラムを試してみてください。下記URLページの全行をコピーし、テキストエディタに貼り付け、適当な名前のファイル（例えば、`L06_1000sequences.txt`）に保存してください。

[https://raw.githubusercontent.com/CropEvol/lecture/master/data/L06_1000sequences.txt](https://raw.githubusercontent.com/CropEvol/lecture/master/data/L06_1000sequences.txt)

---

<div style="page-break-before:always"></div>

### 補足

#### print()とwrite()の違い

　上のプログラムの

```python
...(省略)...
if N_perc >= 0.10:              # N含有率10%以上の場合
    print(name, seq, 'bad')
    BAD.write(name + '\t' + seq + '\n')    # 出力ファイル1に書き込む

else:                           # N含有率10%未満の場合
    print(name, seq, 'good')
    GOOD.write(name + '\t' + seq + '\n')    # 出力ファイル2に書き込む
...(省略)...
```

で、`print()`には改行文字が書かれていません。しかし、Jupyter Notebookの出力結果を見ると、綺麗に改行されているかと思います。
一方で、`write()`は改行文字をわざわざ加えて改行しています。  
　これは、`print()`と`write()`で"出力の終わり"の動作が異なっているためです。`print()`は、出力の終わりに改行文字を自動的に追加してくれます（オプションで変更可能）。一方で、`write()`は改行を付けずに出力します。

```python
import sys      # write()で画面出力（標準出力）するために必要

str1 = 'AAAAA'
str2 = 'BBBBB'

# printの動作確認
print('==== print() ====')
print(str1)
print(str2)

# writeの動作確認（改行なし）
sys.stdout.write('==== write() without line break ====')
sys.stdout.write(str1)
sys.stdout.write(str2)

# writeの動作確認（改行あり）
sys.stdout.write('\n')
sys.stdout.write('==== write() with line break ====' + '\n')
sys.stdout.write(str1 + '\n')
sys.stdout.write(str2 + '\n')
```

　`print()`で改行せずに表示も可能です。引数に`end=''`を加えます。

```python
str1 = 'AAAAA'
str2 = 'BBBBB'

# printの動作確認
print('==== print() ====')
print(str1, end='')
print(str2, end='')

# end= は、出力の終わりを指定するオプションです。
# デフォルト（指定しない場合）は、end='\n'です。
# 上の例では、出力の終わりを"文字なし"にしています。
```

　これは余談ですが、`write()`のみがファイルに出力できる関数ではありません。`print()`でもファイル出力が可能です。引数に`file=''`を加えます。

```python
f = open('aaabbb.txt', 'w') # ファイルを書き込みモードで開く

str1 = 'AAAAA'
str2 = 'BBBBB'

print(str1, file=f)
print(str2, file=f)

print(str1, end='', file=f)
print(str2, end='', file=f)

f.close()

# file= は、出力先を指定するオプションです。
# デフォルトでは、file=sys.stdout（標準出力）になっています。
# 例では、open関数で書き込みモードとして開いた aaabbb.txt に出力しています。
```

#### シークエンス（塩基配列）データのフィルタリング
　次世代シークエンス解析の最初の工程は、シークエンサーから出力された大量の配列（1配列200塩基程度）のうち、解析に使用できる配列と使用できない配列のふるい分けです。この工程は __クオリティコントロール__ と呼ばれています。  
　例えば、上の演習でおこなったように、不明な塩基「N」が多い配列は、その後の解析には不適な場合が多いので、解析前にそのような配列を除外します。

　実際のクオリティコントロールは、使いやすく優れたソフトがすでに存在しているので、自作プログラムでクオリティコントロールをおこなうことはほとんどありません。

---

### 課題
- Web版（[課題ページ](./06_Problem.md) へ）
- 配布プリント（13〜15ページ）
