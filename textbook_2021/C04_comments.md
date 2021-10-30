<img src="https://lh3.googleusercontent.com/pw/AM-JKLVhTn_UySwMdfMwXvoq8l3VN7IkrY9cwtH2YJVMxAlMznUBWC9IpFtgPRIyfAXru4oykkYD-1WjWi0Ao5XgkB9JICvzDBcfn0L_5X2_KOOppsURK5DfSifCC-s7Vx5oQrBUn_BNWn_hfAPdhlVbKQGE=w1097-h235-no?authuser=0" alt="2021年度ゲノム情報解析入門" height="100px" align="middle">

<div align="right"><a href="https://github.com/CropEvol/lecture#section2">実習表ページに戻る</a></div>

# 10月26日の講義へのご意見・ご質問

---

### ご質問

1) ファイルの開き方について、with文ではなくopen,close関数を紹介されていましたが、特段の意図等はございますでしょうか。closeの書き忘れを防ぐためにwith文を用いるよう推奨する書籍を多く見かけるため、気になって質問させていただきました。実務的には、ファイル数の多さから、フォルダを選択した上でその中にあるすべてのファイルをfor文で開いたり閉じたりするといった事情があるのでしょうか。

> 　初学者が理解しやすいと思われる形を教えています。具体的には以下の理由です。
>
> - のちに`for`と`if`を使うのでインデント（階層構造）を少なくしておきたい。`with`構文なしのほうが階層構造を少なくできる
> - できるかぎり、コードは1行に1意（1機能）にしておきたい
>
> 実務的な理由ではありません。基本的には、慣れ親しんでいる形を使えば良いと思います。  
> ただ、Pythonに慣れていたり長期的にそのプログラムを維持管理するのであれば、書き忘れがなくコードも少ない（保守しやすい）`with`を使うほうが良いでしょう。

2) リードデータを扱う際に使用されていた、recsおよびrecという変数についてです。これらは何という語の略称でしょうか。

>　「rec」はrecordで、「recs」はその複数形recordsの略です。

3) FASTQファイルから読み込んだリードデータに含まれるインスタンス変数letter_annotationsについてです。これは辞書オブジェクトですが、今回使用したデータを確認したところ、この辞書に含まれている項目は　キー：”phred_quality”, 値：各塩基のクオリティを順に格納したリスト　の一つだけでした。一つだけであればわざわざ辞書にする必要はないはずなので、（講義のために制作されたテストデータではない）実際のFASTQファイルのletter_annotationsには他のannotationも含まれているのだと思いますが、具体的にはどのような項目が含まれているのでしょうか。

> 講義のために用意したテストデータは、実際のFASTQファイルから作成しています。変更した部分は以下の2点です。
>
> - 10リードのみ取り出した
> - 本来のリード名を簡易な形にした
>
> 実際のFASTQファイルも`letter_annotations`には`{"phred_quality":各塩基のクオリティ}`のみです。
>
> 　`letter_annotations`が辞書型データ構造を採用している正確なところはわかりません。
> 様々なタイプのデータ（アミノ酸配列データなど）にも対応できるようにしたためと思われます。
>
>　私が知る限り、`letter_annotations`に複数の情報が入っている例はPHRED形式ファイル(phdファイル)です。
> これは、サンガーシーケンスで得られる塩基配列データファイルです。
> phdファイルの各塩基のアノテーション（`letter_annotations`）には、次の情報が付与されています。
>
> - `phred_quality`: phredクオリティスコア
> - `peak_location`: 各塩基が検出されたタイムポイントのようなデータ
>
> 参考ノートブック: [PHRED形式データ（.phd）の読み込み](https://colab.research.google.com/github/CropEvol/lecture/blob/master/textbook_2021/seqio_parse.ipynb#scrollTo=GcJT-IvjGEth)
>
>
>　なお、次世代シーケンスデータのクオリティスコアは、現在Phredクオリティスコアで統一されているようですが、以前は別のタイプのクオリティスコアがありました。
>
> - Illumina 1.8以降（現在）: Phredクオリティスコアを使用し、そのスコアにはASCIIコードの33から126までを使用。parse時の読み込み方法は`SeqIO.parse(ファイル変数, "fastq")`
> - Illumina 1.3-1.7: Phredクオリティスコアを使用し、そのスコアにはASCIIコードの64から126までを使用)。parse時の読み込み方法は`SeqIO.parse(ファイル変数, "fastq-illumina")`
> - Illumina 1.3より前: Solexaクオリティスコア（オッズ値を使ったクオリティスコア）を使用し、そのスコアにはASCIIコードの64から126までを使用)。parse時の読み込み方法は`SeqIO.parse(ファイル変数, "fastq-solexa")`
>
> 古い次世代シーケンスデータを扱う場合にはご注意ください。

4) FASTQファイルから読み込んだリードデータに含まれるインスタンス変数 id, name についてです。今回のテストデータでは両者に差は認められませんでしたが、これらに差が生じることはあるのでしょうか。また、name ではなく id の方を「名前」として用いるのが通例である、という解釈でよろしいでしょうか。

> 　FASTAファイルやFASTQファイルでは、インスタンス変数の`id`と`name`が異なることはありません。  
> 「`id`の方を「名前」として用いるのが通例である」の解釈で合っています。
>
> なお、別の形式のデータファイルを読み込んだ時に、それらが異なることはあります（例えば、Genbank形式）。
>
> NCBI（生物学データバンク）に登録されているデータは、「Genbank」と呼ばれるで形式で保管されています。
>
> - 例: [ヒトのミトコンドリアゲノム](https://www.ncbi.nlm.nih.gov/nuccore/NC_012920)
>
> Genbank形式には「ID」と「LOCUS」という情報があります。
Genbank形式ファイルをBiopythonの`SeqIO.parse`で読み込むと、それらの情報はインスタンス変数`id`と`name`に格納されます。
>
> 参考ノートブック: [Genbank形式データ（.gb）の読み込み](https://colab.research.google.com/github/CropEvol/lecture/blob/master/textbook_2021/seqio_parse.ipynb#scrollTo=XGCvqpDUEUpS)


### ご意見

ファイルの読み込み時、with句を使っていないようでしたが、ファイルの閉じ忘れなどを考えると、初学者にはwith句を使用した書き方のほうが良いように思います。  
bioPythonのリファレンスの例を見ても、推奨しているわけではありませんが、with句を使った方式で紹介されています。  
https://biopython.org/wiki/SeqIO

> 上述の質問1の回答のとおり、現在のテキストではopen関数-close関数を採用しています。  
> ご意見も踏まえて、今後テキストをアップデートする際に、with構文を使った形も検討いたします。


