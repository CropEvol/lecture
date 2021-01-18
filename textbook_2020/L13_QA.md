# ご質問・ご意見への回答
---

[ご質問またはご意見]

勾配法のプログラミングについて、学習率が高いほど更新幅が大きくなるという解釈でよろしいでしょうか。トレーニング回数と学習率を大きくすると決定係数の値が減少したのですが、それは何故でしょうか。

[回答]

その解釈で合っています。「学習率」で更新幅を制御しており、学習率を小さくすれば、更新幅が小さくなります。反対に、学習率を大きくすれば、更新幅が大きくなります。

「学習率」（更新幅）があまりに大きいと、更新後のパラメータが極値（optimum; コスト関数の谷の部分）を飛び越えます。場合によっては、極値を目指すような学習がおこなわれずに、パラメータが発散してしまいます（右下図）。

<img src="https://github.com/CropEvol/lecture/blob/master/textbook_2019/images/gradient_descent_eta.png?raw=true" alt="eta" height="300px" align="middle">

---

[ご質問またはご意見]

編集エリア外の
```python
# 学習済み線形回帰モデルの係数と誤差を表示
print("Coefficient=", lr.coef_)   # 係数b （傾き）
print("Intercept="  , lr.intercept_) # 誤差e (切片)
print("R2="  , lr.score(x, y)) # 決定係数R2
```
は最小二乗法での線形回帰モデルの係数と誤差の表示ではないのでしょうか？

これは表示する意味があるのでしょうか？

また、課題内では最小二乗法での学習を行う
```python
from sklearn.linear_model import LinearRegression
lr = LinearRegression()
lr.fit(x, y)
```
をコードしていなくても上記の係数や誤差や表示されるのですが、これはどこで学習しているのでしょうか？

[回答]

`lr.coef_`や`lr.intercept_`がどのようなモデルの係数・誤差なのかは、それより前のコードによって変わってきます。

次のコードでは、「最小二乗法での線形回帰モデル」が変数`lr`に作られるので、`lr.coef_`や`lr.intercept_`は最小二乗法で求めた係数と誤差です。
```python
# モデルの選択・学習
from sklearn.linear_model import LinearRegression
lr = LinearRegression()
lr.fit(x, y)
# 学習済み線形回帰モデルの係数と誤差を表示
print("Coefficient=", lr.coef_)   # 係数b （傾き）
print("Intercept="  , lr.intercept_) # 誤差e (切片)
print("R2="  , lr.score(x, y)) # 決定係数R2
```

一方で、以下のコードでは「確率的勾配降下法での線形回帰モデル」が変数`lr`に作られます。そのため、`lr.coef_`や`lr.intercept_`は確率的勾配降下法で求めた係数と誤差です。
```python
# モデルの選択・学習
from sklearn.linear_model import SGDRegressor
lr = SGDRegressor(max_iter=1000, eta0=0.05, learning_rate="constant")
lr.fit(x, y)
# 学習済み線形回帰モデルの係数と誤差を表示
print("Coefficient=", lr.coef_)   # 係数b （傾き）
print("Intercept="  , lr.intercept_) # 誤差e (切片)
print("R2="  , lr.score(x, y)) # 決定係数R2
```

また、もう一つの質問のほうですが、おそらく課題のノートブック中で一度、以下のようなコードを実行したのではないでしょうか。実行すると、変数`lr`にその学習結果が残ります。

```python
# モデルの選択・学習
from sklearn.linear_model import LinearRegression
lr = LinearRegression()
lr.fit(x, y)
```

---

[ご質問またはご意見]

機械学習は人間の脳の学習過程を模倣して作られたと聞きますが、今回ご紹介された過学習という現象は人間の脳にも起こるのでしょうか。

[回答]

 人間の脳で、実際に「過学習」といえる事例があるのかどうか私は知りません。

 人間の脳には、入力データ中のパラメータを上手く取捨選択する機構が備わっているように思います。無関係な情報を多く含むデータ（多数のパラメータをもったデータ）を入力データにして、学習を続けたとしても、最終的には、必要な情報（パラメータ）のみを使ったモデルを上手く構築できているように見受けられます。  
　ただし、入力データ数が少なすぎたり、偏った入力データを使っているために、一般的な評価で "誤ったモデル" を構築することはあると思います。

 「過学習」と言えるかどうかわかりませんが、熟練のスポーツ選手などで起こりうる「イップス」（これまで普通におこなえてきた動作を、あるときから思うようにできなくなる症状）は、過学習に近い事象のように思います。  
　ある失敗を過剰に学習することで、今まで低い影響力しかもたなかったパラメータに大きな影響力を付与してしまい、その結果、イップスが引き起こされているのかもしれません。
　
