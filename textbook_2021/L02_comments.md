
10月12日の講義へのご意見・ご質問
---

#### ご意見
- 非常に瑣末な話なのですが、Safari版のGoogle Colab画面ではファイル名のアンダーバーが見切れてしまうようです。特に不都合は起きないとは思います
が、受講者によっては一瞬混乱するかもしれないため、「4. ノートブックの名前を変更する」の箇所に説明を加えることをご提案いたします。  
<img src="https://lh3.googleusercontent.com/pw/AM-JKLXkVervAUs5BNH9tgjkCsHibtjv0toIyTAyWGfR8rMknSnJh5bt7RjFojAQnZBcwoAgrleXTFTKnJjpHcfurcBWWkhG8Ek6rdsRT83vJzI8WuEKZTCf2N2WVhOlo7sjbJYXucqGwhjjbtRGuv4C0OeR=w630-h195-no?authuser=0" height="140px">
    - 情報のご提供ありがとうございます。説明を加える等の対応をいたします。

- 予習したいので、今回のように次の回のスライドが早めに上がっているとありがたいです。  
    - 準備状況によっては直前になることもあるかもしれませんが、なるべく早く公開するよう努力いたします。

---

#### ご質問

Python基礎（Ⅰ）課題のlenのところで、
```python
wheatL = len(wheat)
print(wheatL)
```
で、strエラーが出たのですが何でしょうか…？

<img src="https://lh3.googleusercontent.com/pw/AM-JKLXO49NTukx3UfVOlPX0Y8hfwPXyLhbdbTIER3YXSRdsLmScC0ctRSijkOjDwkCgng5HTawQDTGxrSeu3y-kAo69G4qzLXjStiJgxa55v2J5ItZjhFZHR_fFakgxxEIMTVPS8BfyL7n-arKzZsGyNqPf=w842-h504-no?authuser=0" height="200px">


#### 回答
参考ノートブック: [関数名の上書きエラーについて](https://colab.research.google.com/github/CropEvol/lecture/blob/master/textbook_2021/overwrite_function_name.ipynb)

　`len` という名前の変数を、どこかで作成したのではないでしょうか？  
lenという名前の変数を作成すると、`len`が関数名ではなく変数名として認識されるようになります。

```python
len = "ATGC"        # lenという変数を定義すると、
wheatL = len("ATGC") # len関数の機能が失われる
``` 

以下の文字は関数として定義されています。

- print
- len
- count
- list
- dict
- str
- int
- sum

このような名前の変数を作ることは可能ですが、できるかぎり変数名には使用しないほうがいいでしょう。

もし関数名と同じ変数を作ってしまい、元の状態に戻したい場合は、以下の手順でGoogle Colabを再起動してください。
```
ヘッダーの「ランタイム」 > 「ランタイムを再起動」
```


詳しく説明はしませんが、自作関数というものを使うことで、元の関数を壊さずにプログラミングをおこなうことは可能です。
（詳しく知りたい場合は、「Python 名前空間 スコープ」で検索して勉強してください。）


---
#### ご質問
自分で学習を自主的に進めていきたいのですが、課題を授業毎に公開するのではなく全て前もって公開していただくことは可能でしょうか？

#### 回答
今年度のテキストは、まだ準備中のものがあります。  
前年のテキストと大部分は同じかもしれませんが、一部変更する予定です。

前年以前のテキストも公開しておりますので、自学自習にご活用ください。

- 2020年度: https://github.com/CropEvol/lecture/tree/2020
- 2019年度: https://github.com/CropEvol/lecture/tree/2019
- 2018年度: https://github.com/CropEvol/lecture/tree/2018
- 2017年度: https://github.com/CropEvol/lecture/tree/2017


---
#### ご質問

Googleアカウントの設定は日本語なのにグーグルコラボラトリーは英語になっています。ファイルはfile編集はeditというように表示されます。どうすれば日本語表示にできるでしょうか。

#### 回答

開いたノートブックのURLアドレスの最後に、「?hl=en」が付いていませんか？
もし付いている場合、それを消して再読み込みすれば、日本語表示のメニューに変わると思います。

```sh
# 英語
https://colab.research.google.com/github/CropEvol/~~書略~~.ipynb?hl=en

# 日本語
https://colab.research.google.com/github/CropEvol/~~書略~~.ipynb
```

---
#### ご質問
授業をiPadで受けることはどうしても厳しいですか？  

というのも、僕自身ノートパソコンを持っていなくて、今回家にあるデスクトップのパソコンと同時並行でiPadでも操作してみたところ問題ないように思えたのですが、先生が授業の最初でラップトップまたはデスクトップのパソコンで授業を受けてほしいとおっしゃっていたのでなにかiPadのようなタブレットではこのさきできない作業が出てくるのか、と思いました。  

また、もしiPadでどうしても授業を受けることができない場合、機械の貸し出しはしていただくことはできますか？

#### 回答
Google Colabを実行できていれば、iPadのまま授業を受けても不都合ないと思います。

少し気になる点は、iPadへの文字入力はキーボードでおこなっているのでしょうか？それともタッチ入力でしょうか？
今お使いの文字入力方法に慣れているのであれば問題ないかもしれませんが、キーボードがあったほうがプログラミングしやすいのではないかな・・・と個人的には思います。

できるかぎり1、２台の貸し出し用のパソコンを毎回用意しておくつもりですが、（研究室等での）利用状況によっては貸し出しできないこともあります。

---
#### ご質問

本日の講義で一点、気になった部分があります。  

コメントアウトの説明で、コードが2行存在する状況で、1行目のコメントを外してデモを実行された際、1行目の最初に半角スペースが残った状態でしたが、エラーが発生せずに実行できていた模様です。

Pythonはインデントでブロックを認識するため、そうした不正なインデントはエラーが出たと思うのですが、Google Colaboratoryでは問題ないのでしょうか。

※ 家のデスクトップPCのローカル環境で試しましたところ、やはりエラーとなりました。

<img src="https://lh3.googleusercontent.com/pw/AM-JKLUNCzN57IW3AooHNS3kP9hfIZPexzfSViENdIUlbbqU0BBC97k3D3oDaYTPIZS3I6aEjq5moFG47mF6xRmtPtYixijUR8-5E8lM4KUzduqHBtlhjbjE8foWmG3i27cKsQvxJU2TFFgH_YSrnN4OsBnO=w388-h227-no?authuser=0" height="150px">

#### 回答

Google Colab（または、Jupyter）のノートブックでは、1行目のコードにインデントがあったとしてもなぜかエラーなく動くようです。  
なぜこのような仕様になっているのかはわかりません。  

ただ、もしエラーが出ないとしても、構文上のインデント（スペース）以外のインデントは避けるべきです。

```python
# 悪い例: 1行目の行頭に意味のないインデントを付ける
  a = "bad"  
b = "manner"
print(a, b)
```

```python
# 良い例: 各行頭にインデントなし
a = "bad"
b = "manner"
print(a, b)
```