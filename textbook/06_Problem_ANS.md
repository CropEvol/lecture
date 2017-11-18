# 大規模データ解析入門1 [練習問題 解答]

<a href name="section1"></a>
## Problem 1 のコード例

```python
f = open('P06_1_sequences.txt', 'r')            # ファイルを開く
I = open('P06_1_sequences_inrage.txt',   'w')   # 出力ファイル1
O = open('P06_1_sequences_outrange.txt', 'w')   # 出力ファイル2

for line in f:                              # 一行ずつ読み込む
    line = line[:-1]                        # 改行文字を取り除く
    item = line.split('\t')                 # 文字列をタブ文字で分割する
    name = item[0]                          # 配列名を取り出す
    seq  = item[1]                          # 配列本体を取り出す
    seq_size = len(seq)                     # 塩基配列の長さを取得
    G_num = seq.count('G')                  # Gの数を取得
    C_num = seq.count('C')                  # Gの数を取得
    GC_perc = (G_num + C_num)/seq_size      # GC含有率

    if GC_perc >= 0.40 and GC_perc < 0.60:  # 40 <= %GC < 60の場合
        #print(name, GC_perc, 'in_ranege')   # 表示
        I.write(line + '\n')                # 出力ファイル1に書き込む

    else:                                   # 範囲外の場合
        #print(name, GC_perc, 'out_ranege')  # 表示
        O.write(line + '\n')                # 出力ファイル2に書き込む


f.close()   # ファイルを閉じる
I.close()
O.close()

### 補足 ###

```

<a href name="section2"></a>
## Problem 2 のコード例

```python
f = open('P06_2_sequences.fasta',  'r')    # 読み込みファイル
o = open('P06_2_sequences_out.txt','w')    # 書き込みファイル

for line in f:                # 一行ずつ読み込む
    line = line[:-1]          # 改行文字を取り除く

    if line[0] == '>':        # 配列名の行のとき
        name = line[1:]       # 配列名の変数
        #print(name, end='\t') # 表示
        o.write(name + '\t')  # ファイル出力（タブ追加）

    else:                     # 塩基配列（配列名以外）の行のとき
        seq = line            # 塩基配列の変数
        #print(seq, end='\n')  # 表示
        o.write(seq + '\n')   # ファイル出力（改行文字をつける）

f.close()    # ファイルを閉じる
o.close()
```

<a href name="section3"></a>
## Problem 3 のコード例

```python
# コード例 1

f = open('P06_3_sequences.fasta',  'r')    # 読み込みファイル
o = open('P06_3_sequences_out.txt','w')    # 書き込みファイル

firstline = 1                 # first line判定スイッチ(初期値:1(ON))

for line in f:                # 一行ずつ読み込む
    line = line[:-1]          # 改行文字を取り除く

    if line[0] == '>':        # 配列名の行のとき

        if firstline == 0:    # first lineの場合、処理しない
            print()           # 改行のみ表示
            o.write('\n')     # 改行をファイル出力

        name = line[1:]       # 配列名の変数
        print(name, end='\t') # 表示
        o.write(name + '\t')  # ファイル出力（タブ追加）

    else:                     # 塩基配列（配列名以外）の行のとき
        seq = line            # 塩基配列の変数
        print(seq, end='')    # 表示（改行しない）
        o.write(seq)          # ファイル出力（改行文字しない）

    firstline = 0             # first line判定スイッチOFF

f.close()    # ファイルを閉じる
o.close()

### 解説 ###
# 上のプログラムは、行を通過するたびに出力するようにしています。
# 配列名の行のときはタブ文字を追加して出力、配列本体の行のときは改行せずに出力しています。
# 改行は、次のデータに移ったタイミング（行頭に'>'を見つけたとき）でおこなうようにしています。
# ただし、最初の行だけは改行処理を飛ばさないと、不要な一行が出力されてしまいます。
# そこで、最初の行かどうかを判定するスイッチを用意して、最初の行を処理しないようにしています。
```

```python
# コード例 2

f = open('P06_3_sequences.fasta',  'r')    # 読み込みファイル
o = open('P06_3_sequences_out.txt','w')    # 書き込みファイル

firstline = 1                 # first line判定スイッチ(初期値:1(ON))
name = ''
seq  = ''

for line in f:                # 一行ずつ読み込む
    line = line[:-1]          # 改行文字を取り除く

    if line[0] == '>':        # 配列名の行のとき

        # 次のデータに移ったタイミングで出力
        # ただし、first lineの場合、処理しない
        if firstline == 0:
            print(name + '\t' + seq)
            o.write(name + '\t' + seq + '\n')
            name = ''
            seq  = ''

        name = line[1:]       # 配列名の変数

    else:                     # 塩基配列（配列名以外）の行のとき
        seq = seq + line      # 塩基配列の変数
        firstline = 0         # first line判定スイッチOFF

# ここで最後のデータを出力
print(name + '\t' + seq)
o.write(name + '\t' + seq + '\n')


f.close()    # ファイルを閉じる
o.close()

### 解説 ###
# このコードは、1データ分の配列名と配列本体を一時的に保持する変数name,seqを用意しています。
# 1データを処理している間は、配列名がnameに保持され、塩基配列が一行ごとにseqに追加されていきます。
# そして、次のデータに移ったタイミングで出力し、両変数を空（カラ）にしています。
# ただし、最初の行だけは出力処理を飛ばさないと、不要な一行が出力されてしまいます。
# そこで、最初の行かどうかを判定するスイッチを用意して、最初の行は処理しないようにしています。
# 最後のデータは、その後に'>'がないため、for文中では処理されません。
# 最後のデータはfor文から出た後に出力しています。
```

<a href name="section4"></a>
## Problem 4 のコード例

```python
# 正規表現を使って(1)〜(3)の処理をおこなう

import re   # 正規表現用モジュール

s1 = 'ABCDEF'
s2 = '123456'
s3 = '7ABCDE'
s4 = 'A8BCDE'
s5 = 'ABCDE9'
s6 = 'GHIJKL'

moji_list = [s1, s2, s3, s4, s5, s6]

# (1)先頭が数字の文字列を表示する
print('--- (1) ---')
p1 = re.compile('^[0-9]')   # ←検索パターンをここに追記
for moji in moji_list:
    m1 = p1.search(moji)    # 検索
    if m1:                  # 検索パターンに一致した場合
        print(moji)         # 表示


# (2)最後が数字の文字列を表示する
print('--- (2) ---')
p2 = re.compile('[0-9]$')   # ←検索パターンをここに追記
for moji in moji_list:
    m2 = p2.search(moji)    # 検索
    if m2:                  # 検索パターンに一致した場合
        print(moji)         # 表示


# (3)数字を含まない文字列を表示する
print('--- (3) ---')
p3 = re.compile('^\D+$')    # ←検索パターンをここに追記
for moji in moji_list:
    m3 = p3.search(moji)    # 検索
    if m3:                  # 検索パターンに一致した場合
        print(moji)         # 表示

### 解説 ###
# (1)と(2)の解説
#
# [] は「囲まれた文字のどれか（指定内の任意文字）」を表します。
# [0-9] は「0から9の数字どれか」という意味になります。
# ^ は「先頭」を表すメタ文字です。
# ^[0-9] とすることで、「0-9の数字どれかで始まる」という意味になります。
# $ は「末尾」を表すメタ文字です。
# [0-9]$ とすることで、「0-9の数字どれかで終わる」という意味になります。
#
# (3)の解説
#
# \D は「数字以外の文字」を表します。
# + は「直前の文字が1回以上」を表します。
# ^\D+$ とすることで、
#「数字以外の文字で始まり、数字以外の文字が続き、数字以外の文字で終わる」
# という意味になります。
```
