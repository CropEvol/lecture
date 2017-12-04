# R入門2 [練習問題]

## Problem 1
講義中に利用したデータや、自分で持っている何らかの使えそうなデータを使った、グラフ描写を行うプログラムを書き、説明と共にコードを提出してください。<br>
```
# 例
library(ggplot2)
df <- read.csv("https://raw.githubusercontent.com/CropEvol/lecture/master/data/L10_mouse_data.csv",header=T,row.names=1)
g <- ggplot(df, aes (x = lung_capacity, ))
g <- g + geom_histogram()    # ヒストグラムを追加
print(g)

# 30個体分の肺活量をヒストグラムで表した。
```


## Problem 2
講義で紹介したものや、参考として載せてあるものなど、データ解析に関する手法の中から好きなものを選び(独自に調べたものでも可能)、
農学や生物学の研究にどのように役立ちそうか調べて書いてください。
