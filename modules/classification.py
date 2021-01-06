# classification.py
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.colors import ListedColormap

def draw_decision_boundary(x1_train, x2_train, y_train, x1_test, x2_test, y_test,
                           labels, model, resolution=0.02, xlabel="x1", ylabel="x2"):
  # マーカーとカラー
  markers = ('o', 'x', 's', '^', '+', 'D')
  colors = ('red', 'blue', 'green', 'purple', 'yellow', 'silver')
  cmap = ListedColormap(colors[:len(np.unique(y_train))])
  # データの最小値、最大値
  x1_min, x1_max = min(x1_train.min(), x1_test.min())-1, max(x1_train.max(), x1_test.max())+1
  x2_min, x2_max = min(x2_train.min(), x2_test.min())-1, max(x2_train.max(), x2_test.max())+1
  # メッシュ用のデータポイント
  x1_mesh, x2_mesh = np.meshgrid(np.arange(x1_min, x1_max, resolution),
                                  np.arange(x2_min, x2_max, resolution))
  # メッシュ用データポイントの予測ラベル
  z = model.predict(np.array([x1_mesh.ravel(), x2_mesh.ravel()]).T)
  z = z.reshape(x1_mesh.shape)
  # グラフ
  fig = plt.figure(figsize=(12,5))
  ax1 = fig.add_subplot(1,2,1)
  ax1.set_title("Training dataset")
  ax1.set_xlim(x1_min, x1_max)
  ax1.set_ylim(x2_min, x2_max)
  ax1.set_xlabel(xlabel)
  ax1.set_ylabel(ylabel)
  ax2 = fig.add_subplot(1,2,2)
  ax2.set_title("Test dataset")
  ax2.set_xlim(x1_min, x1_max)
  ax2.set_ylim(x2_min, x2_max)
  ax2.set_xlabel(xlabel)
  ax2.set_ylabel(ylabel)

  # メッシュの色ぬり
  ax1.contourf(x1_mesh, x2_mesh, z, alpha=0.2, cmap=cmap)
  ax2.contourf(x1_mesh, x2_mesh, z, alpha=0.2, cmap=cmap)
  # データをプロット
  for i, c in enumerate(np.unique(y_train)):
    # トレーニングデータ
    ax1.scatter(x1_train[y_train==c], x2_train[y_train==c], label=np.unique(labels)[i],
                marker=markers[i], color=colors[i], edgecolors='black', s=48)
    # テストデータ
    ax2.scatter(x1_test[y_test==c], x2_test[y_test==c], label=np.unique(labels)[i],
                marker=markers[i], color=colors[i], edgecolors='black', s=48)
  plt.rcParams["font.size"] = 14
  plt.legend(bbox_to_anchor=(1.05, 1), loc='upper left')
  plt.show()
