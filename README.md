<a name="section1"></a>
# ゲノム博物学入門 [2022年度 ILASセミナー]

## セミナーの実施
- 前期 毎週月曜 16:45-18:15
- 対面 または ミーティングツール Zoom 上でおこないます

## Pythonプログラミング解析環境
[Google Colaboratory](https://colab.research.google.com/notebooks/welcome.ipynb)と呼ばれるサービスを利用します。

Googleアカウントが必要です。持っていない場合は作成してください。→ [Googleアカウント新規作成](https://accounts.google.com/signup/v2/webcreateaccount?continue=https%3A%2F%2Fwww.google.co.jp%2F&hl=ja&gmb=exp&biz=false&flowName=GlifWebSignIn&flowEntry=SignUp)


## データ解析実習表
1. Googleアカウントにログインする
1. 下記実習表のリンクをクリックして、Google Colabノートブックページに移動する

| No. | 日付 | テキスト |
|:---|:---|:---|
| 01 | 6月6日 | [RNA-seq基礎](https://github.com/CropEvol/lecture/blob/master/ILAS_2022/RNAseq_intro/ILAS_2206.pdf)<br>[RNA-seq基礎 - 実習](./ILAS_2022/RNAseq_intro/ILAS_2206_train.md) |
| 02 | 6月13日 | [事前準備](./ILAS_2022/01/L01_requirements.md)<br>[Pythonプログラミング入門](https://colab.research.google.com/github/CropEvol/lecture/blob/master/ILAS_2022/RNAseq_intro/RNAseq_analysis_Intro.ipynb)(Google Colab) |
| 03 | 6月27日 | [PythonでBLAST検索](https://colab.research.google.com/github/CropEvol/lecture/blob/master/ILAS_2022/RNAseq_intro/RNAseq_analysis_BLAST.ipynb)(Google Colab) |
| 04 | 7月11日 | [RNA-seq解析](https://github.com/CropEvol/lecture/blob/master/ILAS_2022/RNAseq_intro/ILAS_2207.pdf)(PDF)<br>[サンプルデータ](https://drive.google.com/drive/folders/1qDryCj-yPjIBbNBV7FF0zMPU1oOJUU6U?usp=sharing) |

データ解析でよく使うサイト:
- 相同性検索 [NCBI BLASTX](https://blast.ncbi.nlm.nih.gov/Blast.cgi?PROGRAM=blastx&PAGE_TYPE=BlastSearch&LINK_LOC=blasthome)
- タンパク質データベース [UniProt](https://www.uniprot.org/)
- 論文検索 [Google scholar](https://scholar.google.co.jp/)


その他テキスト:
- [Python基礎](https://colab.research.google.com/github/CropEvol/lecture/blob/master/ILAS_2022/01/L01_python_basis.ipynb)(Google Colab)
- [Pythonデータ解析基礎](https://colab.research.google.com/github/CropEvol/lecture/blob/master/ILAS_2022/02/L02_python_analysis.ipynb)(Google Colab)
- [2020年度のテキスト](https://github.com/CropEvol/lecture/tree/2020)
- [2021年度のテキスト](https://github.com/CropEvol/lecture/tree/2021)


---

<a name="section2"></a>
# ゲノム情報解析入門 [2022年度 学部講義]

- 時間：毎週火曜 14:45 - 16:15  
- [シラバス](https://ocw.kyoto-u.ac.jp/syllabus/?act=detail&syllabus_id=agr_5140&year=2022)

## 必要なもの
実習では、[Google Colaboratory](https://colab.research.google.com/notebooks/welcome.ipynb)を使います。  
- インターネットブラウザ
  - 対応ブラウザ（推奨）
    - Google Chrome
    - FireFox
    - Safari
  - 非推奨ブラウザ（動作検証されていない）
    - Microsoft Edge
  - 非対応ブラウザ（利用不可）
    - Internet Explorer
- Googleアカウント
  - 持っていない場合は以下を参考に作成してください
  - [Googleアカウント取得方法](https://github.com/CropEvol/lecture/blob/master/textbook_2019/L02_create_google_acount.md)


## 解析実習表

各回の授業開始前までに、Googleアカウントへの [ログイン](https://www.google.com/accounts/login) を済ませ、このページを開いておいてください。

| No. | 実習内容 | 日付 | 資料 | その他 |
|:---|:---|:---|:---|:---|
|01| 講義についての説明 | 10月4日 | [課題](https://panda.ecs.kyoto-u.ac.jp/x/1HTMEU) |  |
|02| Google Colaboratoryの使い方 | 10月11日 | [テキスト](https://colab.research.google.com/github/CropEvol/lecture/blob/master/textbook_2022/First_GoogleColab.ipynb)<br>[課題](https://panda.ecs.kyoto-u.ac.jp/x/1HTMEU) | [Q&A](https://github.com/CropEvol/lecture/blob/master/textbook_2022/L02_QA.md) |
|03| DNAシーケンス | 10月18日 | [課題](https://panda.ecs.kyoto-u.ac.jp/x/1HTMEU) |  |
|04| DNAシーケンス/ゲノムアセンブリ | 11月1日 | [課題](https://panda.ecs.kyoto-u.ac.jp/x/1HTMEU) | |
|05| QTL-seq入門(1) 参照配列の準備 | 11月8日 | [テキスト](https://colab.research.google.com/github/CropEvol/lecture/blob/master/textbook_2022/QTLseq_1.ipynb)<br>[課題](https://colab.research.google.com/github/CropEvol/lecture/blob/master/textbook_2022/QTLseq_1_hw.ipynb)<br>[課題解答例](https://colab.research.google.com/github/CropEvol/lecture/blob/master/textbook_2022/QTLseq_1_hw_ans.ipynb) | [Q&A](https://github.com/CropEvol/lecture/blob/master/textbook_2022/L05_QA.md) |
|06| QTL-seq入門(2) リードアライメント、SNP検出 | 11月15日 | [テキスト](https://colab.research.google.com/github/CropEvol/lecture/blob/master/textbook_2022/QTLseq_2.ipynb)<br>[課題](https://colab.research.google.com/github/CropEvol/lecture/blob/master/textbook_2022/QTLseq_2_hw.ipynb) | |
|07| QTL-seq入門(3) SNP-indexの算出、グラフ描画 | 11月22日 | [テキスト](https://colab.research.google.com/github/CropEvol/lecture/blob/master/textbook_2022/QTLseq_3.ipynb)<br>課題 | |
|08| | | | |
|09| | | | |
|10| | | | |
|11| | | | |
|12| | | | |
|13| | | | |
|14| | | | |
|15| | | | |

_実習内容は、進捗状況により変更することがあります。_

_各回の課題は、講義終了後 (16:15頃)にアップロードいたします。_

## 出欠確認方法
各回の課題の提出状況により出欠確認をいたします。  
課題未提出の場合、欠席扱いになりますのでご注意ください。  


## 課題提出方法
各回の課題は、[PandA](https://panda.ecs.kyoto-u.ac.jp/portal/login) を使って提出してください。  
提出方法の詳細は、各課題ページに記載いたします。

## 講義で紹介した書籍やサイトなど
- 書籍 [Bayesian Methods for Hackers](https://camdavidsonpilon.github.io/Probabilistic-Programming-and-Bayesian-Methods-for-Hackers/)
- 動画 [People of Science: Thomas Bayes and Ronald Fisher
](https://g.co/arts/FjZasjDGQzKRFtvt7)


---

<a name="section4"></a>
## 過去の年度のテキスト
- [2017年度](https://github.com/CropEvol/lecture/tree/2017)
- [2018年度](https://github.com/CropEvol/lecture/tree/2018)
- [2019年度](https://github.com/CropEvol/lecture/tree/2019)
- [2020年度](https://github.com/CropEvol/lecture/tree/2020)
- [2021年度](https://github.com/CropEvol/lecture/tree/2021)


---
Copyright&copy; 2022 [Crop Evolution Lab., Kyoto Univ.](http://www.crop-evolution.kais.kyoto-u.ac.jp/) All rights reserved.
