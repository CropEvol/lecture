# classification.py
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.colors import ListedColormap

def draw_decision_boundary(x1, x2, y, labels, model, resolution=0.02, xlabel="x1", ylabel="x2"):
  # マーカーとカラー
  markers = ('s', 'x', 'o', '*', 'D')
  colors = ('red', 'blue', 'green', 'purple', 'yellow')
  cmap = ListedColormap(colors[:len(np.unique(y))])
  # データの最小値、最大値
  x1_min, x1_max = x1.min()-1, x1.max()+1
  x2_min, x2_max = x2.min()-1, x2.max()+1
  # メッシュ用のデータポイント
  x1_mesh, x2_mesh = np.meshgrid(np.arange(x1_min, x1_max, resolution),
                                  np.arange(x2_min, x2_max, resolution))
  # メッシュ用データポイントの予測ラベル
  z = model.predict(np.array([x1_mesh.ravel(), x2_mesh.ravel()]).T)
  z = z.reshape(x1_mesh.shape)
  # グラフ
  fig = plt.figure(figsize=(8,6))
  # メッシュの色ぬり
  plt.contourf(x1_mesh, x2_mesh, z, alpha=0.3, cmap=cmap)
  # データをプロット
  for i, c in enumerate(np.unique(y)):
    plt.scatter(x1[y==c], x2[y==c], label=np.unique(labels)[i],
                color=colors[i], edgecolors='black',
                marker=markers[i], s=48)
  plt.rcParams["font.size"] = 14
  plt.xlim(x1_mesh.min(), x1_mesh.max())
  plt.ylim(x2_mesh.min(), x2_mesh.max())
  plt.xlabel(xlabel)
  plt.ylabel(ylabel)
  plt.legend(bbox_to_anchor=(1.05, 1), loc='upper left')
  plt.show()

# 決定境界のアニメーション
def animation_decision_boundary(G,x1, x2, y, labels, model,
                    resolution=0.02, xlabel="x1", ylabel="x2", n_frames=10):
  # === 静止画 ===
  ax = G.add_subplot(1,1,1)
  # 散布図
  for i, c in enumerate(np.unique(y)):
      ax.scatter(x1[y==c], x2[y==c], label=np.unique(labels)[i],
              color=colors[i], edgecolors='black', marker=markers[i], s=48)
  ax.set_xlabel(xlabel, fontsize=14)
  ax.set_ylabel(ylabel, fontsize=14)

  return frames
