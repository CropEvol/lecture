# 機械学習についての復習

## 機械学習の種類
  - 教師あり学習 Supervised learning
    - 回帰 regression *← 前回*
    - 分類 classification *← 今回*
  - 教師なし学習 Unsupervised learning
  - 強化学習 Reinforcement learning

## 教師あり学習の手順

1. 前処理: __トレーニングデータ（training data）__ と __テストデータ（test data）__ を準備する。
2. 選択: 使用するモデルや設定値（ __ハイパーパラメータ__ ）を選択する。
3. 学習: トレーニングデータを使って、モデルを学習させて、予測モデルを構築する。
4. 評価: テストデータを使って、学習済みの予測モデルを評価する。
  - 結果が良くなければ、2へ戻る。
  - 結果が良ければ、5へ進む。
5. 予測・解釈: 予測モデルを新しいデータに適用する。または、予測モデルを解釈する。

<img src="https://github.com/CropEvol/lecture/blob/master/textbook_2019/images/supervised_learning_process.png?raw=true" alt="supervised_learning_process" height="60px">

## 「線形回帰」モデル

予測モデル = 線形方程式

<img src="https://github.com/CropEvol/lecture/blob/2018/textbook_2018/09_statistics/data/regression_base.png?raw=true" alt="regression" height="150px">


モデルの学習  
= __コスト関数 (Cost function)__ 、多くの場合「実測値と予測値の差」を最小化する  
= 最もデータに適合する __パラメータ__ （係数 *β* や 誤差 *e* ）を見つける

<img src="https://github.com/CropEvol/lecture/blob/master/textbook_2019/images/regression2.png?raw=true" alt="regression" height="200px">


## パラメータの最適値探索

- __最小二乗法 (Least squares method)__ を使って、ピンポイントに最適値を求める
- __勾配法 (Gradient method)__ を使って、徐々にパラメータを更新する
  - __確率的勾配降下法 Stochastic Gradient Descent__
  - __最急降下法 Gradient Descent__

<img src="https://github.com/CropEvol/lecture/blob/master/textbook_2019/images/gradient_method.png?raw=true" alt="gradient_method" height="200px">


## ハイパーパラメータが重要

勾配法では、パラメータの更新幅は「学習率 *η* （イータ eta)」で制御される

<img src="https://github.com/CropEvol/lecture/blob/master/textbook_2019/images/gradient_method_algorithm.png?raw=true" alt="gradient_method_algorithm" height="200px">

学習率は、トレーニングデータからは最適化されないパラメータ（ __ハイパーパラメータ Hyperparameter__ ）である
- 学習率が低すぎると（更新幅が小さすぎると）、最適値まで届かずに学習を終える
- 学習率が高すぎると（更新幅が大きすぎると）、パラメータが発散して、最適値を得られない

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
