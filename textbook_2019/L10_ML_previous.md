# 機械学習についての復習

## 機械学習の分類
  - 教師あり学習 Supervised learning
    - 回帰 regression *← 前回*
    - 分類 classification *← 今回*
  - 教師なし学習 Unsupervised learning
  - 強化学習 Reinforcement learning

## 「線形回帰」モデル

予測モデル = 線形方程式

<img src="https://github.com/CropEvol/lecture/blob/2018/textbook_2018/09_statistics/data/regression_base.png?raw=true" alt="regression" height="150px">


モデルの学習
= **コスト関数 (Cost function)**を最小化する
= 最もデータに適合する**パラメータ**（係数$\beta$ や 誤差$e$）を見つける

<img src="https://github.com/CropEvol/lecture/blob/master/textbook_2019/images/regression2.png?raw=true" alt="regression" height="200px">


## パラメータの最適値探索

- **最小二乗法 (Least squares method)**を使って、ピンポイントに最適値を求める
- **勾配法 (Gradient method)**を使って、徐々にパラメータを更新する
  - **確率的勾配降下法 Stochastic Gradient Descent**
  - **最急降下法 Gradient Descent**

<img src="https://github.com/CropEvol/lecture/blob/master/textbook_2019/images/gradient_method.png?raw=true" alt="gradient_method" height="200px">


## ハイパーパラメータが重要

勾配法では、パラメータの更新幅を学習率$\eta$（イータ eta)で制御する

<img src="https://github.com/CropEvol/lecture/blob/master/textbook_2019/images/gradient_method_algorithm.png?raw=true" alt="gradient_method_algorithm" height="200px">

学習率は、トレーニングデータからは最適化されないパラメータ（**ハイパーパラメータ Hyperparameter**）である
- 低すぎると（更新幅が小さすぎると）、最適値まで届かずに学習を終える
- 高すぎると（更新幅が大きすぎると）、パラメータが発散して、最適値が得られない

<img src="https://github.com/CropEvol/lecture/blob/master/textbook_2019/images/gradient_descent_eta.png?raw=true" alt="gradient_descent_eta" height="200px">


## scikit-learnを使った機械学習プログラム

モデルの作成と学習は、3行でおこなえる
```python
from sklearn.機能 import 関数     # 使用する関数を準備
モデル変数 = 関数(ハイパーパラメータ) # モデルを作成
モデル変数.fit(トレーニングデータ)   # モデルを学習

# 最小二乗法による線形回帰
from sklearn.linear_model import LinearRegression
regr = LinearRegression()
regr.fit(x_train, y_train)

# 確率的勾配降下法による線形回帰
from sklearn.linear_model import SGDRegressor
regr = SGDRegressor(max_iter=100, eta0=0.1)
regr.fit(x_train, y_train)
```
