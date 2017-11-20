# 大規模データ解析入門2 [練習問題]

　遺伝子の発現量を調べる方法のひとつに、次世代シークエンサーを使った __RNAシークエンシング (RNA-seq)__ と呼ばれる方法があります。今回の練習問題で使うデータは、そのRNA-seqデータと思ってください。

　下記の2つのURLにあるデータを、エディタに貼り付けて、ファイルに保存してください。  

(1) 遺伝子名のリスト: `P07_gene_name.txt`  
左の列から、遺伝子ID 'GeneID'、遺伝子名 'GeneName' の順に並んでいます。  
[https://raw.githubusercontent.com/CropEvol/lecture/master/data/P07_gene_name.txt](https://raw.githubusercontent.com/CropEvol/lecture/master/data/P07_gene_name.txt)  

(2) 遺伝子発現量のリスト: `P07_gene_expression.txt`  
左の列から、遺伝子ID 'GeneID' 、サンプル1の発現量 'Expression_1'、 サンプル2の発現量 'Expression_2'、統計的有意性 'Significant' の順に並んでいます。  
[https://raw.githubusercontent.com/CropEvol/lecture/master/data/P07_gene_expression.txt](https://raw.githubusercontent.com/CropEvol/lecture/master/data/P07_gene_expression.txt)

## Problem 1
　`P07_gene_name.txt`と`P07_gene_expression.txt`をPandasで読み込み、2つのデータフレームの `GeneID` をキーにして結合してください。

## Problem 2
　`P07_gene_expression.txt`をPandasで読み込み(*1)、 `Expression_1` と `Expression_2` の値の自然対数（log）を求め、それぞれ `LogExp_1` 列、 `LogExp_2` 列として新たに加えてください。  
_*1 Problem 1の後のデータフレームを使っても構いません。_

[ヒント]
logの計算には、Numpyライブラリが必要です。

```python
import numpy as np  # Numpyのインポート
# 「np」という名前で呼び出せるようにしている

x1 = 10000      # 対数変換前の数字
x2 = np.log(x1) # 自然対数
print(x2)
```

<div style="page-break-before:always"></div>

## Problem 3
　`P07_gene_expression.txt` をPandasで読み込み(*2)、 `Significant` が `yes` の遺伝子（すなわち、統計的に有意な差がある遺伝子）のみを抽出してください。  
_*2 Problem 1やProblem 2の後のデータフレームを使っても構いません。_

## Problem 4
　Problem 2の後のデータフレームを使い、 `LogExp_1` と `LogExp_2` の値をそれぞれ横軸と縦軸にとり、1000個の遺伝子すベてをプロットした散布図を作成してください。その際、 `Significant` が `no` の遺伝子は灰色（`gray`）、 `yes` の遺伝子は赤色（`red`）のプロットにしてください。

[ヒント]
1. `Significant` が `yes` のみのデータフレームと `no` のみのデータフレームを用意する必要があります。
2. 用意した2つのデータを1つのグラフにプロット。

```python
#####################################
# 1つのグラフに2種類のデータをプロットする #
#####################################

import numpy as np  # Numpyライブラリのインポート

# 100個のデータをランダムに作成（データ1）
df1 = pd.DataFrame(np.random.randn(100, 2), columns=('X', 'Y'))
# 20個のデータをランダムに作成（データ2）
df2 = pd.DataFrame(np.random.randn(20, 2), columns=('X', 'Y'))

# df1（データ1）を青色でプロット
# そのグラフに「myfig」という名前を付ける。
# kindオプションに'scatter'を指定すれば「散布図」になる。
# colorオプションでプロットの色を指定する。
myfig = df1.plot(x='X', y='Y', kind='scatter', color='blue')

# df2（データ2）を赤色でプロット
# axオプションにdf1のグラフの名前を指定することで、df1と同じグラフにプロット可能。
df2.plot(x='X', y='Y', kind='scatter', color='red', ax = myfig)
```
