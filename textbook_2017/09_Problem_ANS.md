# R入門 [練習問題・解答例]

## Problem 1
　データを読み込み、lung_capacityの平均値を求めるコードを書く
```R
# (1) データの読み込み
df <- read.csv("https://raw.githubusercontent.com/CropEvol/lecture/master/data/L10_mouse_data.csv",header=T,row.names=1)

# (2) lung_capacity列を取り出し、変数lcに入れる
lc <- df['lung_capacity']

# (3) lc (lung_capacity)の平均値を求める
colMeans(lc)

# 上記(2)(3)は一行にすることも可能
colMeans(df['lung_capacity'])
```
