# 解析実習（分子系統解析）

今回、サンガー法で得られたシーケンスを使って系統解析（系統樹の作成）をおこなっていきます。

## 解析の流れ
1. [シーケンスの確認・トリミング](#sec1)
2. [アセンブル](#sec2)
3. [シーケンスの統合](#sec3)
4. [系統樹の作成](#sec4)
5. [類似シーケンスの検索](#sec5)

<img src="https://github.com/CropEvol/lecture/blob/master/FFBCexpr_2024spr/images/workflow.png?raw=true" height="250px"/>

<h2 id="sec1">1. シーケンスの確認・トリミング</h2>

<h3>1.1 サンガーシーケンスの波形ファイル（AB1ファイル）の確認</h3>

サンガーシーケンスをおこなうと波形ファイル（各塩基のシグナル強度のデータ）が得られます。そのデータをみることで、シーケンスの精度を評価できます。

<img src="https://github.com/CropEvol/lecture/blob/master/FFBCexpr_2024spr/images/sanger_ab1.png?raw=true" height="250px"/>

波形データファイル（AB1ファイル）は、以下のURLの各班のフォルダのなかの`ab1__遺伝子名`フォルダ に入っています。

シーケンスデータの保管フォルダ:  
https://drive.google.com/drive/folders/1IPESCNqfTjPZ-DV1gVEe7XYq4yQymYnc?usp=sharing

保管フォルダ内のフォワードプライマーで得られたAB1ファイルをひとつ選んで、ダウンロードしてください。

そのAB1ファイルをWebツール「Teal」にアップロードし、確認してみましょう。  
<a href="https://www.gear-genomics.com/teal/" target="_blank">https://www.gear-genomics.com/teal/</a>

AB1ファイルの確認手順:  
1. Inputタブで「ファイルを選択」をクリックし、ダウンロードしたAB1ファイルを選ぶ
2. 「Launch Analysis」をクリックする
3. 自動的にResultsタブに切り替わり、波形データと塩基配列が表示される
4. 波形の状態を目視で確認し、塩基のシグナルが明確な範囲を決定する

<img src="https://github.com/CropEvol/lecture/blob/master/FFBCexpr_2024spr/images/teal.png?raw=true" height="250px"/>

<h3>1.2 シーケンスのトリミング（切り出し）</h3>

シーケンスのトリミングには「EMBOSS: extractseq」を使います。  
https://www.bioinformatics.nl/cgi-bin/emboss/extractseq

トリミングの手順
1. 「Teal」のResultsタブに表示されている塩基配列をコピーする
2. コピーした配列を「EMBOSS: extractseq」のテキストボックスに貼り付ける
3. 切り出す範囲を"Regions to extract"のフォームに入力する
4. 「Run extract」をクリックする
5. 出力された塩基配列をコピーし、テキストエディタ（Wordやメモ帳など）に貼り付けておく

<img src="https://github.com/CropEvol/lecture/blob/master/FFBCexpr_2024spr/images/extractseq.png?raw=true" height="250px"/>

<h3>練習</h3>

相補鎖側の配列（リバースプライマーで読んだシーケンス）に対しても1.1-1.2の操作をおこなってください

<img src="https://github.com/CropEvol/lecture/blob/master/FFBCexpr_2024spr/images/forward_and_reverse_ab1.png?raw=true" height="150px"/>

<h2 id="sec2">2. アセンブル</h2>

<h3 id="sec2">2.1 アセンブル</h3>

部分的に相同性のある2つ以上の配列を統合し、1つのより長い配列を構築することを**アセンブル**と言います。

今回の実習では、ひとつの遺伝領域をフォワードプライマーとリバースプライマーを使って二方向からシーケンスを取得しました。その二つのシーケンスをアセンブルし、ひとつの塩基配列にしましょう。

<img src="https://github.com/CropEvol/lecture/blob/master/FFBCexpr_2024spr/images/assemble.png?raw=true" height="250px"/>

サンガーシーケンスのアセンブルには「CAP3」と呼ばれるソフトウェアがよく使われています。今回、そのWebサービス版を使用します。  
https://doua.prabi.fr/software/cap3

アセンブルの手順:
1. ステップ1.2で得たフォワード側とリバース側の塩基配列を「CAP3」のテキストボックスに貼り付けて、「SUBMIT」をクリックする
2. アセンブルが終わると、自動的にResultsページに移行する
3. 「Assemble details」でどのようにアセンブルされたかを確認する。このときフォワード側のシーケンス名に "+" 、リバース側のシーケンスが "-"が付いていることを確認する
	- `+`: 入力したシーケンスがアセンブルに使われたことを表す
	- `-`: 入力したシーケンスの相補鎖配列がアセンブルに使われたことを表す
4. 「Contigs」にアセンブル結果の塩基配列（FASTA形式で記述されている）が出力されています

<img src="https://github.com/CropEvol/lecture/blob/master/FFBCexpr_2024spr/images/cap3.png?raw=true" height="250px"/>

<h3 id="sec2">2.2 相補鎖変換</h3>

アセンブル結果が相補鎖配列の場合（フォワード側が"-"、リバース側が"+"でアセンブルされた場合）、以下のWebツールを使って、その配列を相補鎖変換する  
https://www.genscript.com/sms2/rev_comp.html

<img src="https://github.com/CropEvol/lecture/blob/master/FFBCexpr_2024spr/images/rev_comp.png?raw=true" height="250px"/>

<h2 id="sec3">3. シーケンスの統合</h2>

この後の系統解析のためには、各サンプルの塩基配列を集める必要があります。

Googleドライブの共有フォルダ内に、各サンプルのアセンブル配列を集めるためのファイル（遺伝領域名.docx）を置いています。

Googleドライブ共有フォルダ:  
https://drive.google.com/drive/folders/1IPESCNqfTjPZ-DV1gVEe7XYq4yQymYnc?usp=sharing

そのファイルにアセンブル配列をコピー＆ペーストしてください。  
**重要：それぞれの配列の名前（FASTA形式の配列名）をサンプル名に変更してください**

<img src="https://github.com/CropEvol/lecture/blob/master/FFBCexpr_2024spr/images/gene_sequence_file.png?raw=true" height="250px"/>

<h2 id="sec4">4. 系統樹の作成</h2>

系統樹の作成もWebサービス（例えば、NGPhylogeny.fr; 下記URL）を使って簡単におこなえます。  
https://ngphylogeny.fr/

今回は、どのように系統樹を作成しているかを理解するためにも「A la Carte」モードで実行していきましょう。「A la Carte」では、系統樹作成の各ステップのツールを自分で指定できます。

NGPhylogenyの系統樹作成は４ステップでおこなわれます。
1. **マルチプルアライメント（Multiple Alignment）**: サンプル間の塩基配列が揃うように並べる
2. **アライメントの整形（Alignment Curation）**: 欠失データなどが多いポジションの情報は除外し、使用可能な塩基のみを残す
3. **系統樹の推定（Tree Inference）**: サンプル間の塩基の類似度を算出し、系統関係を推定する
4. **系統樹の描画（Tree Rendering）**: 推定した系統樹を描画する

<img src="https://github.com/CropEvol/lecture/blob/master/FFBCexpr_2024spr/images/phylogeny_process.png?raw=true" height="150px"/>

実習での系統樹作成の手順: 
1. 「A la Carte」をクリック
2.  各ステップは以下のツールを選び、「Create workflow」をクリックする
	- Multiple Alignment: MAFFT
	- Alignment Curation: BMGE
	- Tree Inference: FastME
	- Tree Rendering: Newick Display
3. 前ステップ「3. シーケンスの統合」で準備したFASTA形式データをすべてコピーし、Input dataのテキストボックスに貼り付ける
4. 各ステップのツールのオプションを次のようにする
	- MAFFT: デフォルトのまま（変更しない）
	- BMGE: 「Gap Rate cut-off [ 0-1 ]」の値を`0` にする。今回、挿入欠失変異（InDel）を考慮せずに、SNPのみを考慮して系統解析をおこなう
	- FastME: 「Bootstrap branch supports」を`Yes`にする。このオプションで出力されるブートストラップ値は、系統樹の各枝の信頼度の指標になる
	- Newick Display: デフォルトのまま（変更しない）

<img src="https://github.com/CropEvol/lecture/blob/master/FFBCexpr_2024spr/images/phylogeny_fr.png?raw=true" height="250px"/>

<h2 id="sec5">5. 類似シーケンスの検索</h2>

次世代シーケンサーや第3次シーケンサー（ロングリードシーケンサー）が登場して以降、多くの生物でゲノムが解読されるようになってきました。解読されたゲノム配列はDNAデータバンクなどで公開されています。

おもなDNAデータバンク: 
- [NCBI（National Center for Biotechnology Information; アメリカ）](https://www.ncbi.nlm.nih.gov/)
- [DDBJ（DNA Data Bank of Japan; 日本）](https://www.ddbj.nig.ac.jp/index.html)
- [ENA (European Nucleotide Archive; イギリス)](https://www.ebi.ac.uk/ena/browser/home)

実習で使った植物種（タルホコムギやアワなど）やその近縁種も代表系統のゲノム配列が公開しています。

コムギ関係の公開ゲノム配列:  
- *Aegilops sharonensis*（コムギ近縁野生種） https://www.ncbi.nlm.nih.gov/datasets/genome/GCA_904067115.1/
- *Triticum aestivum*（パンコムギ） https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018294505.1/
- *Triticum aestivum* subsp. *spelta*（スペルトコムギ） https://www.ncbi.nlm.nih.gov/datasets/genome/GCA_903994165.1/

アワ関係の公開ゲノム配列:  
- *Setaria italica*（アワ） https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_000263155.2/
- *Setaria viridis*（エノコログサ） https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_005286985.1/

ここでは、公開ゲノム配列から実習の遺伝領域の塩基配列を得てみましょう。

手順:
1. 上記の公開ゲノム配列ページに移動する
2. 「BLAST the reference genome」をクリックする
3. 実習で取得した遺伝領域の塩基配列（※1）を"Enter Query Sequence"のテキストボックスに貼り付ける  
	<small>※1 長い塩基配列が得られている系統であれば、どの系統でもOK</small>
4. 画面下のほうにある「BLAST」をクリックする
5. 検索結果のうち、上位の結果をクリックする
6. 「GenBank」をクリックする
7. 表示されたページの「FASTA」をクリックする

<img src="https://github.com/CropEvol/lecture/blob/master/FFBCexpr_2024spr/images/ncbi_blast_1.png?raw=true" height="250px"/>
<img src="https://github.com/CropEvol/lecture/blob/master/FFBCexpr_2024spr/images/ncbi_blast_2.png?raw=true" height="200px"/>

