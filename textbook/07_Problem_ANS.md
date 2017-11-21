# 大規模データ解析入門2 [練習問題 解答]

<a href name="section1"></a>
## Problem 1 のコード例

```python
import pandas as pd
%matplotlib inline

NAME = 'P07_gene_name.txt'
EXP  = 'P07_gene_expression.txt'

df_N = pd.read_csv(NAME, sep='\t', header=0)
df_E = pd.read_csv(EXP,  sep='\t', header=0)

df = df_N.merge(df_E, on='GeneID', how='inner')

df
```

<a href name="section2"></a>
## Problem 2 のコード例
　「Problem 1のコード例」実行後のデータを使っています。

```python
import numpy as np

df['LogExp_1'] = np.log(df['Expression_1'])
df['LogExp_2'] = np.log(df['Expression_2'])

df
```

<a href name="section3"></a>
## Problem 3 のコード例
　「Problem 2のコード例」実行後のデータを使っています。

```python
df[df['Significant'] == 'yes']
```

<a href name="section4"></a>
## Problem 4 のコード例
　「Problem 2のコード例」実行後のデータを使っています。

```python
df_N = df[df['Significant'] == 'no']
df_Y = df[df['Significant'] == 'yes']

G = df_N.plot(x='LogExp_1', y='LogExp_2', kind='scatter', color='gray')
df_Y.plot(x='LogExp_1', y='LogExp_2', kind='scatter', color='red', ax = G)
```
