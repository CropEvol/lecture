# ご質問・ご意見への回答
---

[ご質問またはご意見]

課題の中で　`plt.figure(figsize=[... ])`と`plt.scatter(x,y,...)`との順番を間違えると、なぜ2つの図が出てしまうのでしょうか。

[回答]

`plt.figure()`はグラフフィールドを設定するためのコードです。matplotlibでは`plt.figure()`で設定したフィールドに1枚のグラフを書くためのパーツを追加していくことになります。

`plt.scatter(x,y,...)`を先に書くと、おそらくですが、グラフを描くためのコード（`plt.figure()`と`plt.show()`）もバックグラウンドで実行されているのでしょう。

```python
plt.figure()  # バックグラウンドで実行
plt.scatter(x,y,...)
plt.show()    # バックグラウンドで実行

plt.figure(figsize=[... ])
 :
 :
```

`plt.figure(figsize=[... ])`を明示した後に`plt.scatter(x,y,...)`を書くと、バックグラウンドで　実行される`plt.figure()`はなくなり、一つだけグラフが描画されるのだと思われます。

```python
plt.figure(figsize=[... ])
#plt.figure()  # バックグラウンドで実行されなくなる
plt.scatter(x,y,...)
 :
 :
plt.show()    # 明示しなければ、バックグラウンドで実行
```

---

[ご質問またはご意見]

df_Hを使わないで、dfで課題４を解決する方法はありますか？

plt.scatter( x , y > 0.4 , color="red" )
でやってみましたが、正しい図を得られませんでした。それはなぜですか？

[回答]

`df_H`を使わずにdfで課題４を解決する方法はあります。
`df_H`に代入操作をおこなわずに、「条件に合った行データの抽出」＋列データの取得をおこなえば同じことが可能です。

```python
import pandas as pd
df = pd.read_csv("hw_dataset_mini.txt", sep=",", header=0)

x=df["POS"]
y=df["Hetero"]

x1=df[df["Hetero"]>=0.4]["POS"]
y1=df[df["Hetero"]>=0.4]["Hetero"]

plt.figure(figsize=[12, 4])
plt.scatter(x,y)
plt.scatter(x1,y1,color="red")
plt.xlabel("Position")
plt.ylabel("Expected Heterozygosity")
plt.ylim([-0.01, 0.51])
plt.show()
```

以下、後者の質問への回答です。
`plt.scatter( x , y > 0.4 , color="red" )`の`y>0.4`から得られるデータは、y座標の値のリストデータではなく、`True/False`のリストです。そのため、正しいグラフが得られません。

---

[ご質問またはご意見]

散布図を描くときにy軸をy=~ ではなくf1=~ として設定したのはなぜでしょうか。（授業中に説明なさっていたなら、聞き逃してすみません）

[回答]

上で使った変数名と別の変数名にするためです。`y=`でもOKです。

---
[ご質問またはご意見]

やはり、コピー＆ペーストができません。セルを誤って消したりした場合に、一動作前に戻すことはできませんか。

[回答]

誤って消したセルを元に戻す方法は、次の操作で可能です。
- ヘッダーメニュー「編集」 > 「セルの削除を元に戻す」


コピー＆ペーストができない理由ははっきりとわかりませんが、ブラウザの設定でコピー＆ペースト無効になっているのかもしれません。

念のため、シークレットウィンドウ（プライベートウィンドウ）でもコピー＆ペーストできないか確認してみてください。
- Google Chrome: メニューバー「ファイル」 >「新規シークレットウィンドウ」
- FireFox: メニューバー「ファイル」 > 「新規プライベートウィンドウ」

また、ブラウザの初期化も検討してみてください。
- FireFox: https://support.mozilla.org/ja/kb/reset-preferences-fix-problems
- Google Chrome: https://support.google.com/chrome/answer/3296214?hl=ja
