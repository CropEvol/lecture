<img src="https://lh3.googleusercontent.com/pw/AM-JKLVhTn_UySwMdfMwXvoq8l3VN7IkrY9cwtH2YJVMxAlMznUBWC9IpFtgPRIyfAXru4oykkYD-1WjWi0Ao5XgkB9JICvzDBcfn0L_5X2_KOOppsURK5DfSifCC-s7Vx5oQrBUn_BNWn_hfAPdhlVbKQGE=w1097-h235-no?authuser=0" alt="2021年度ゲノム情報解析入門" height="100px" align="middle">

<div align="right"><a href="https://github.com/CropEvol/lecture#section2">実習表ページに戻る</a></div>

# 11月16日の講義へのご意見・ご質問

● 課題2で、

```python
df["df_H"] = df[df["Hetero"] >= 0.4]
df
```

と入力したらdf_HにはＨeteroの値が0.4以上の所には2Ｄと出力されていたが、これはどんな意味があるのでしょうか。

> 詳しいことはわかりません。
> 条件に適合したデータのデータフレームのうち、`CHR`の列のみが追加されたのかと思われます。
> 
> 以下、ご提出いただいたコードのパーツの解説です。
> 
> `df["df_H"] = df[df["Hetero"] >= 0.4]`のコードは、既存のデータフレームに新しい列`df_H`を追加するコードです。
> 追加されるデータは、右辺に書いた`df[df["Hetero"] >= 0.4]`です。
> 
> つぎに、`df[df["Hetero"] >= 0.4]`でどのようなデータが得られるかについてですが、条件（`df["Hetero"] >= 0.4`）に適合したデータのみが書かれたデータフレームが出力されます。そのデータは、元の100行分のデータよりも少ないデータ（35行分のデータ）です。
> 
> 100行のデータフレームの新しい列に35行分のデータを追加しようとしても、通常ではエラーが出力されるはずです（行数が合わないことに由来するエラーが出力されるはずです）。
> 
> 私の方でいただいたコードを再度実行してみましたが、やはりエラーが出力されました。
> 状況を再現できなかったため、詳細に何が起こっていたのかを特定することはできませんでした。
> 
> なお、この課題の正解は、`=`の左辺に新しい変数名`df_H`を書く（条件に合ったデータのみを新しいデータフレームにする）コードです。
> ```python
> df_H = df[df["Hetero"] >= 0.4]
> df
> ```
