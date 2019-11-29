# gradient_method.py
import numpy as np
from matplotlib import *
from copy import deepcopy

# 最急降下法
class GradientDescent(object):
  """
  # 学習
  model = GradientDescent(max_iter=100, eta0=0.01)
  model.fit(X, y)
  # 予測
  model.predict(X)
  # 各種情報取得
  model.coef_
  model.intercept_
  model.log_coef
  model.log_intercept
  model.log_cost
  """
  def __init__(self, max_iter=100, eta0=0.01):
    self.eta0     = eta0     # 学習率
    self.max_iter = max_iter # トレーニング回数

  def update(self, X, y):
    # 残差
    errors = y - np.dot(X, self.b_[1:]) - self.b_[0]
    # 更新
    self.b_[1:] = self.b_[1:] + self.eta0 * X.T.dot(errors)  # bの更新
    self.b_[0]  = self.b_[0] + self.eta0 * errors.sum()     # eの更新
    return errors

  def loss(self, errors):
    total_error = (errors**2).sum() / 2.0 / self.sample_size
    return total_error

  def fit(self, X, y):
    self.sample_size = len(X) # サンプルサイズ
    self.b_ = np.zeros(1 + X.shape[1])  # パラメータの初期値
    self.log_coef     = []                # bの記録用リスト
    self.log_intercept = []               # eの記録用リスト
    self.log_cost     = []                # コストの記録用リスト
    pre_cost = 0.0  # 初期コスト

    # イテレーション
    for i in range(self.max_iter):
      # パラメータの更新
      errors = self.update(X, y)
      # コストの計算
      cost = self.loss(errors)
      if pre_cost == cost:
        break
      # リストに追加
      self.log_coef.append(deepcopy(self.b_[1:]))
      self.log_intercept.append(self.b_[0])
      self.log_cost.append(cost)

      # イテレーションの停止
      if cost > 10**10:  # 発散
        break
      elif pre_cost == cost:  # コストが変化しない
        break
      else:
        pre_cost = cost

    # 学習後の係数と誤差
    self.coef_     = self.b_[1:]
    self.intercept_ = self.b_[0]

  def predict(self, X):
    output = np.dot(X, self.b_[1:]) + self.b_[0]  # 予測値
    return output

  def score(self, X, y):
    y_pred = self.predict(X)
    r2 = 1- np.sum((y - y_pred)**2)/np.sum((y - np.mean(y))**2)
    return r2



# 確率的勾配降下法
class StochasticGradientDescent(object):
  """
  # 学習
  model = StochasticGradientDescent(max_iter=100, eta0=0.01, shuffle=True, random_state=None)
  model.fit(X, y)
  # 予測
  model.predict(X)
  # 各種情報取得
  model.coef_
  model.intercept_
  model.log_coef
  model.log_intercept
  model.log_cost
  """
  def __init__(self, max_iter=100, eta0=0.01, shuffle=True, random_state=None):
    self.eta0     = eta0     # 学習率
    self.max_iter = max_iter # トレーニング回数
    self.shuffle = shuffle     # 各イテレーションごとにデータをシャッフルするかどうか
    self.b_initialized = False
    # ランダムシード
    if random_state:
      np.random.seed(random_state)

  def initialize_weight(self, m):
    self.b_ = np.zeros(1 + m)
    self.b_initialized = True

  def _shuffle(self, X, y):
    r = np.random.permutation(len(y))
    return X[r], y[r]

  def update(self, xi, yi):
    # 残差
    error = yi - np.dot(xi, self.b_[1:]) - self.b_[0]
    # 更新
    self.b_[1:] = self.b_[1:] + self.eta0 * xi.dot(error)  # bの更新
    self.b_[0]  = self.b_[0] + self.eta0 * error         # eの更新
    #　コストの計算
    cost = 0.5 * error**2
    return cost

  def partial_fit(self, X, y):
    # オンライン学習用（重みを初期化しない）
    # 初期化されていない場合は初期化を実行
    if not self.b_initialized:
      self.initialize_weight(X.shape[1])
    # 目的変数の要素数が2以上の場合、各サンプルのxiとyiで重みを更新
    if y.ravel().shape[0] > 1:
      for xi, yi in zip(X, y):
        self.update(xi, yi)
    # 目的変数の要素数が1の場合、サンプル全体で重みを更新
    else:
      self.update(X, y)
    # # 記録
    # self.log_cost.append(avg_cost)
    # self.log_coef.append(deepcopy(self.b_[1:]))
    # self.log_intercept.append(self.b_[0])
    # 学習後の係数と誤差
    self.coef_     = self.b_[1:]
    self.intercept_ = self.b_[0]

  def fit(self, X, y):
    self.sample_size = len(X) # サンプルサイズ
    self.initialize_weight(X.shape[1])   # パラメータの初期値
    self.log_coef     = []               # bの記録用リスト
    self.log_intercept = []              # eの記録用リスト
    self.log_cost     = []                # コストの記録用リスト
    pre_cost = 0.0  # 初期平均コスト

    # イテレーション
    for i in range(self.max_iter):
      # データをシャッフルする
      if self.shuffle:
        X, y = self._shuffle(X, y)
      # 各サンプルのコストを格納するリスト
      cost = []
      # 各サンプルのコストを計算
      for xi, yi in zip(X, y):
        cost.append(self.update(xi, yi))
      avg_cost = np.mean(cost) #平均コスト
      # 記録
      self.log_cost.append(avg_cost)
      self.log_coef.append(deepcopy(self.b_[1:]))
      self.log_intercept.append(self.b_[0])

      # イテレーションの停止
      if avg_cost > 10**10:  # 発散
        break
      elif pre_cost == avg_cost:  # コストが変化しない
        break
      else:
        pre_cost = avg_cost

    # 学習後の係数と誤差
    self.coef_     = self.b_[1:]
    self.intercept_ = self.b_[0]

  def predict(self, X):
    output = np.dot(X, self.b_[1:]) + self.b_[0]  # 予測値
    return output

  def score(self, X, y):
    y_pred = self.predict(X)
    r2 = 1- np.sum((y - y_pred)**2)/np.sum((y - np.mean(y))**2)
    return r2


# 動画用の関数
# 動画用の関数
def plot_reg(G, x_, y_, b_, e_, c_, n_frames=10):
  # グラフ作成&散布図
  ax1 = G.add_subplot(1, 2, 1)
  ax1.scatter(x_, y_, color="blue")
  # 直線用のデータ
  x_line = np.linspace(np.min(x_), np.max(x_), num=2)
  # 動画用のデータ
  frames = []
  # 動画にするログのインターバル
  i = len(e_)//n_frames
  if i == 0:
    i = 1
  for b, e in zip(b_[0::i], e_[0::i]):
    # 回帰直線
    y_line = x_line * b + e
    reg_line = ax1.plot(x_line, y_line, color="orange", alpha=0.5, lw=3)
    # テキスト
    wt = "Linear model: y = bx + e\nb={0}, e={1}".format(b, e)
    t = ax1.text(0.5, 1.01, wt, ha='center', va='bottom', transform=ax1.transAxes)
    frames.append(tuple(reg_line) + (t, ))

  # イテレーション - コストのグラフ
  iters = np.array(range(len(c_))) # x
  ax2 = G.add_subplot(1, 2, 2)
  ax2.plot(iters, c_)
  ax2.set_xlabel("iterations")
  ax2.set_ylabel("cost")

  return frames
