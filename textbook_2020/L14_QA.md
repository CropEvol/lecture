# ご質問・ご意見への回答
---

[ご質問またはご意見]

今回はラベルが二種類しかありませんでしたが、もっと多くのラベルに分類する際はまた別のアルゴリズムが必要なのでしょうか？

[回答]

同じ分類アルゴリズムを使います。

多ラベル分類の仕方はおもに2通りあり、何が使えるかは分類アルゴリズムや最適化手法によって異なります。

その2通りの方法を、ここでは3つのラベルの分類を例に説明します。

1. 1対他（A vs. A以外、B vs. B以外、C vs. C以外）をおこなう分類モデルを作ります（3つのモデルを作ります）。予測には、その3つのモデルを使って、Aに所属する確率、Bに所属する確率、Cに所属する確率を調べます。

次のような結果が得られた場合、予測値をCと判定します。
- 「A vs. A以外」モデルから、Aに所属する確率 → 0.34
- 「B vs. B以外」モデルから、Bに所属する確率 → 0.46
- 「C vs. C以外」モデルから、Cに所属する確率 → 0.71
（注意点として、3つのモデルから得られた確率の合計値は1ではない）

対応している分類アルゴリズム
- 最適化手法がLiblinearの場合のロジスティック回帰
- サポートベクトルマシン（ただし、上述のように確率として値が得られるわけではなく、3つの境界線を作り、エリア分けします）

<img src="https://github.com/CropEvol/lecture/blob/master/textbook_2019/images/OvR.png?raw=true" alt="OvR" height="200px">

1. A, B, Cに所属する確率を同時に求められるモデルを作ります。予測には、それぞの所属確率をみて、最も高い確率の情報を採用します。

次のような結果が得られた場合、予測値をCと判定します。
- Aに所属する確率  → 0.15
- Bに所属する確率  → 0.20
- Cに所属する確率  → 0.65
（得られた確率の合計値は1になる）

対応している分類アルゴリズム
- ロジスティック回帰（Liblinear以外の最適化手法）
- 決定木（ただし、確率ではなく、あるクラスの枝として表現されます）
- ランダムフォレスト
- ニューラルネットワーク

より詳しく知りたい場合は、「多クラス分類」をWeb検索してみてください。
