# 散布図や折れ線グラフの描画についての補足

 散布図を描くためには、各点のx座標とy座標の情報が必要です。

 もし5点の散布図を描きたい場合、5個のx座標が入ったリスト状データと、5個のy座標が入ったリスト状データを用意します。それらの要素のペアが散布図の各プロットの座標データになります。

```python
import matplotlib.pyplot as plt

# プロットするデータ
x = [1,2,3,4,5]
y = [3,4,2,3,4]

plt.scatter(x, y) # 散布図
#plt.plot(x, y)    # 折れ線グラフ
```

<img src="https://lh3.googleusercontent.com/pw/ACtC-3dFDSrA1n5fHPykCjx4FnJ7zySfe2GEvLKspI_x5FFfIANrB6PY9FgClU5BzAxSJsEuMEFz8XdtoKYK2R4WmL9L97y4l0DDPkwgkAfQIvOG4l1dAkR_mAL2lB37eIH5YK7NH6wlYcDMhzjKU-_eTczU=w1064-h808-no?authuser=0" alt="scatter_input" height="200px">

 なお、散布図の各点を直線で結んだグラフが「折れ線グラフ」です。
