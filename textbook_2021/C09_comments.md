<img src="https://lh3.googleusercontent.com/pw/AM-JKLVhTn_UySwMdfMwXvoq8l3VN7IkrY9cwtH2YJVMxAlMznUBWC9IpFtgPRIyfAXru4oykkYD-1WjWi0Ao5XgkB9JICvzDBcfn0L_5X2_KOOppsURK5DfSifCC-s7Vx5oQrBUn_BNWn_hfAPdhlVbKQGE=w1097-h235-no?authuser=0" alt="2021年度ゲノム情報解析入門" height="100px" align="middle">

<div align="right"><a href="https://github.com/CropEvol/lecture#section2">実習表ページに戻る</a></div>

# 12月7日の講義へのご意見・ご質問

● 
● 【質問2】テキストで提示されたループの終了条件について

テキストの「3-1. 各区間の平均SNP-indexの算出を自動化する」のWhileループの終了条件が、

```python
  if end > chrom_size:
    break
```

となっておりますが、この条件でループを終了すると、最後のウインドウに含まれるはずの部分が計算されないのではないでしょうか。

この例では、「22,200,001～23,200,000」の次の区間は「22,400,001～23,400,000」となりますが、23,400,000はchrom_size=23,207,287を超えているためここでループが終了し、「22,400,001～23,207,287」の区間については処理が行われないのではないでしょうか。

この区間の処理が行われないことについては問題ないのでしょうか。

> windowサイズやstepサイズ次第、染色体の長さ次第で、データ数（SNP数）が極端に少なくなる場合があり、そのような区間のデータを使わないようにするために、最後の余り区間の処理をおこなわないようにしています。
> 
> 実際の解析では、最後の余り区間にも十分なデータがあると判断できれば、その区間も含めたグラフ描画をおこなえば良いでしょう。


【質問2】平均を求める際のデータの個数の変動について

各区間で抽出されるデータの個数は一定ではありませんが、抽出されるデータの個数が一定でないことによる影響はないのでしょうか。

外れ値の影響などを懸念しております。

例えば、平均に関しては一般的に、データの個数が少ない場合は外れ値等による影響が大きく表れ、データの個数が多い場合は外れ値による影響があまり表れません。

こうした影響は考慮しなくてもよいのでしょうか、それとも統計学的に担保されているなど、この処理方法に織り込み済みなのでしょうか。

テキストのコードに各区間のデータの個数を追加して可視化してみましたが、かなり変動があるようです。（緑色の線です）

> データの個数が一定でないこと（とくにデータ数が少ないこと）による悪い影響は十分に考えられます。通常は、データの個数も考慮して、解析をおこなうのが良いでしょう（例えば、データ数が少ない場合その区間を除外するなど）。  
> 
> また、データによっては、平均値ではなく中央値を採用する方がよいかもしれません。
> 
> 今回取り上げていませんが、実際のMutMap解析では、観測されたSNP-indexの発生確率をシミュレーションで調べる方法が使われています。任意の確率（よく使われるのは5%や1%）未満でしか発生しないと判断できる場合、その区間を"統計的に有意"とし、原因遺伝子座に同定する方法です。  
> SNP-indexのシミュレーションについては、2018年のゲノム情報解析入門で取り上げたことがあるので、参考にしてください。  
> [2018年のテキスト](https://github.com/CropEvol/lecture/tree/2018)
> 
> また、これも今回の実習では取り上げていませんが、SNP数ベースでsliding window解析をおこなう方法もあります。こちらのほうが非常に簡単なコードでできます。ただし、ゲノム解析ではあまりメジャーではありません。
>
> ```python
> # データ数ベースのsliding window平均
> # 例: window size 20 SNPs: step size 1 SNP
> df["POS"].rolling(20).mean()
> df["SNP_index"].rolling(20).mean()
> ```

