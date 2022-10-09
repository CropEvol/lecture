import datetime
import numpy as np
import pandas as pd
from matplotlib import pyplot as plt
import matplotlib.cm as cm
from windrose import WindroseAxes
import japanize_matplotlib
japanize_matplotlib.japanize()
import warnings
warnings.simplefilter('ignore')

def wind_barplot(data, prefecture="京都", date_from="2021-4-1", date_to="2022-9-30"):
  ## 風向き: str-float変換リスト
  wd_str_to_float = {
      '北':'0',
      '北北東':'22.5',
      '北東':'45', 
      '東北東':'67.5',
      '東':'90',  
      '東南東':'112.5', 
      '南東':'135', 
      '南南東':'157.5', 
      '南':'180', 
      '南南西':'202.5', 
      '南西':'225', 
      '西南西':'247.5', 
      '西':'270',
      '西北西':'292.5', 
      '北西':'315', 
      '北北西':'337.5',         
      '静穏':'0'
  }
  
  ## 風向きstrをfloat値に変換
  d = data.replace(wd_str_to_float)
  ## 日付列の取り出し & datetime形式に変換
  dt = d.iloc[:,0].astype('str') + "-" + d.iloc[:,1].astype('str') + "-" +d.iloc[:,2].astype('str')
  dt = pd.to_datetime(dt, format='%Y-%m-%d')
  d["date"] = dt
  
  ## 日付（入力値）
  d_from = datetime.datetime.strptime(date_from, '%Y-%m-%d')
  d_to   = datetime.datetime.strptime(date_to, '%Y-%m-%d')
  ## 都道府県（入力値）
  p = prefecture
  ## 入力値に合わせたデータを取り出す
  d = d[(d.date>=d_from) & (d.date<=d_to)].loc[:, ["date",p]].dropna()
  ws = d.iloc[:, 1].tolist()
  wd = d.iloc[:, 2].tolist()

  ## グラフタイトル用文字列（日付）
  d_min = d.date.min()
  d_min = "%d/%d/%d" % (d_min.year, d_min.month, d_min.day)
  d_max = d.date.max()
  d_max = "%d/%d/%d" % (d_max.year, d_max.month, d_max.day)
  ## 風配図描画
  ax = WindroseAxes.from_ax()
  ax.bar(wd, ws, normed=True, opening=0.9, edgecolor='gray', cmap=cm.bwr)
  ax.set_legend(title="wind speed (m/s)", title_fontsize=12, bbox_to_anchor=(1.0, 0.4), loc='upper left', fontsize=18)
  plt.title("%s, %s - %s" % (p, d_min, d_max))
  plt.show()