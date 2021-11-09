<img src="https://lh3.googleusercontent.com/pw/AM-JKLVhTn_UySwMdfMwXvoq8l3VN7IkrY9cwtH2YJVMxAlMznUBWC9IpFtgPRIyfAXru4oykkYD-1WjWi0Ao5XgkB9JICvzDBcfn0L_5X2_KOOppsURK5DfSifCC-s7Vx5oQrBUn_BNWn_hfAPdhlVbKQGE=w1097-h235-no?authuser=0" alt="2021年度ゲノム情報解析入門" height="100px" align="middle">

<div align="right"><a href="https://github.com/CropEvol/lecture#section2">実習表ページに戻る</a></div>

# 11月2日の講義へのご意見・ご質問

● 課題１で、データを１行ずつ取り出しているが、それらをどうやって1つのリストに入れるのかがわからなかった。  
すべて改行されてしまい、1つのリストに入れることができなかったため、sum()を使うことができず、わからなかった。  
この場合はどうしたら良いのか、次回の解説で学びたいです。

● 課題１がかなり難しくてネットで調べながら取り組んだのですが、他にも簡単な方法があるのか知りたいです。

● 最初課題１でsumを使って考えたがうまくいかなかった。どうすればいいのか知りたい。


> ゲノムサイズ（各染色体の長さの合計値）を調べるために、`sum`関数を使う必要があると考えた方が多かったようですが、`sum`関数を使わずに問題を解くことができます。
> 
> [課題解答例](https://colab.research.google.com/github/CropEvol/lecture/blob/master/textbook_2021/L03_2_python_library_biopython.HW.ANS.ipynb)に、`sum`関数を使う方法と使わない方法の両方を載せてます。

---

● 課題1で、`seq_length = len(rec.seq)` としたあと、その合計を `sum(seq_length)` で求めようとしたのですが, `TypeError: 'int' object is not iterable` とでて実行できず、いろいろと調べたのですが結局分かりませんでした。なぜこれがいけなかったのか、またどのようにすればよいのか、知りたいです。

● 課題１で、sum関数でゲノムサイズを計算しようと思ったのですが、うまくいかなかったです。intは繰り返し不可、のようなエラーが出ました。

> 下記のようなコードを解答いただいきました。
> 
> ```python
> for rec in recs:
>   seq_length = len(rec.seq)
>   print(seq_length)
> 
> print(sum(seq_length))
> ```
> 
> 上のコードでは、for構文中の`seq_length`はループのたびに中身が上書きされます。前のループの情報は`seq_length`に保持されません。  
> ```
> 最初のループ: chromosome_01の塩基配列の長さ（260）がseq_lengthに代入される
> 次のループ:   chromosome_02の塩基配列の長さ（661）がseq_lengthに代入される
> 次のループ:   chromosome_03の塩基配列の長さ（299）がseq_lengthに代入される
> 次のループ:   chromosome_04の塩基配列の長さ（243）がseq_lengthに代入される
> :
> ```
> 
> 各ループの情報（今回の課題では各塩基配列の長さ）を何らかの形で保持する必要があります。
> 
> つぎに、最後のコード`print(sum(seq_length))`が上手くいかない理由についてです。  
> `sum`関数は、リスト状に収まっている数値データに対して、その合計値を求める関数です。
> 上記のコードでは、`seq_length`の中身がリスト状データではなく、単一の数値データのため、`sum`関数が受け取れる型のデータではありません。  
> 
> `sum`関数を使ってこの課題を解くには、各塩基配列の長さをリスト状データにする必要があります。  
> 


---

● 授業中、もう少し大きい声で解説してほしいです。

> わかりました。気をつけるようにいたします。

---

● テキストでFASTA形式で読み込んだ際の返り値を「recs」という名前の変数で受け取っていますが、何か意図はありますでしょうか。  

「recs」という変数名の場合、レコードのリストか何かを想起される方が多いのではないかと思います。  

`SeqIO.parse`が返却するのはリストではなくイテレータですので、誤解を招きにくい変数名のほうが良いのではないでしょうか。  

```python
### FASTA形式で読み込み
recs = SeqIO.parse(f, "fasta")
```

> 1レコード（1データ）の取り出し先`rec`に対応したものとして、その取り出し元の"データの集合"を`recs`で表現しているだけです。
> 
> 誤解を招くのではないかということですので、`SeqIO.parse`の結果を代入する変数名は今後検討いたします。
