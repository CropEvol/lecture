# gradient_method.py
import numpy as np

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
      self.log_coef.append(self.b_[1:])
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
