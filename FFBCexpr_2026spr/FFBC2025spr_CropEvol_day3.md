# 解析実習（分子系統解析）

今回、サンガー法で得られたシーケンスを使って系統解析（系統樹の作成）をおこなっていきます。

## 解析の流れ
1. [シーケンスの確認・アラインメント](#sec1)
2. [系統樹の構築](#sec2)
3. [系統樹の可視化・編集](#sec3)
4. [データベースの活用](#sec4)
5. [練習](#sec5)


<img src="https://github.com/CropEvol/lecture/blob/master/FFBCexpr_2026spr/images/whole_process.png?raw=true" height="250px"/>

<h2 id="sec1">1. シーケンスの確認・アラインメント</h2>

<h3>1.1 配列データ（FASTAファイル）の確認</h3>

シーケンスをおこなうと塩基配列が得られます。塩基配列のデータは`FASTA`ファイルや`FASTQ`ファイルとして保存します。

今回は採集した4種の植物の`rbcL遺伝子`のDNA配列をサンガーシーケンスによって読み取ったデータを`FASTA`ファイルとして保存しています。

FASTAフォーマットは、配列名を示す">配列名"という行と、その配列"ATGCATGC..."によって構成されています。

(`FASTQ`については後期の実習で扱う予定です。)

<img src="https://github.com/CropEvol/lecture/blob/master/FFBCexpr_2026spr/images/fasta.png?raw=true" height="250px"/>

下記リンク先に採集しDNAを抽出した植物種の、`rbcL遺伝子`のDNA配列データが入ったFASTAファイルを置いてあります。ダウンロードしてください。

シーケンスデータの保管フォルダ:
https://drive.google.com/drive/folders/1xQ_6eMzsFKl56kA5LMOoaKhuws4ImoN4?usp=sharing

<h3>1.2 シーケンスのアラインメント</h3>

取得した配列は同じ遺伝子領域の配列をシーケンスしたものですが、シーケンスの条件や変異によって配列を並べた時の位置がずれることがあります。これらを類似する部分が対応付けられる様に並べて、変異や欠損等がある場所が分かるようにする工程をアライメントといいます。

<img src="https://github.com/CropEvol/lecture/blob/master/FFBCexpr_2026spr/images/alignment.png?raw=true" height="150px"/>

シーケンスのアラインメントには様々なプログラムが存在していますが、今回は「MAFFT」というプログラムを使います。

https://mafft.cbrc.jp/alignment/server/

<h4>アラインメントの手順</h4>

1. FASTAファイルの塩基配列をコピー、またはアップロードする
2. 条件などを設定し(今回はそのままで)「Submit」をする。
3. 「View」でアラインメント結果を確認する。
4. 出力された結果を「Fasta format」からダウンロードしておく

<img src="https://github.com/CropEvol/lecture/blob/master/FFBCexpr_2026spr/images/mafft.png?raw=true" height="550px"/>


<h2 id="sec2">2. 系統樹の構築</h2>

系統樹の構築のためのツールは様々な手法やツールが開発されていますが、Web上で扱うことが可能な「IQ-TREE」を今回は使用します。

https://www.hiv.lanl.gov/content/sequence/IQTREE/iqtree.html

<h4>系統樹構築の手順</h4>

1. 先ほど作成したアラインメント結果のFASTAファイルをコピー、またはアップロードする
2. Substituion Modelの設定をする。(塩基置換速度のモデルを設定)
3. Brach Supportの設定をする。(系統樹の信頼性の計算方法の設定)
3. 「Submit」で系統樹の推測を開始する。
4. 出力された結果から、「Newick」のリンク先のテキストをファイルに保存しておく

実際の研究における解析では、得られた配列からどのSubstituion Modelが最適か解析した上でモデルを選択し、系統樹を構築することが多いですが、今回は、下記の設定で試してみましょう。

* Sequence type/Model: GTR
* Rate heterogeneity: Gamma model
* State frequency: Estimated by Maximmum likelihood
* Bootstrap: Ultrafast # of replicates 1000
* Single branch test: SH-aLRT branch test

系統樹のデータを保存する形式としては、NewickフォーマットやNexusフォーマット等が良く使用されます。

<img src="https://github.com/CropEvol/lecture/blob/master/FFBCexpr_2026spr/images/phylogeny.png?raw=true" height="550px"/>

<h2 id="sec3">3. 系統樹の可視化</h2>

先ほど利用したIQ-TREEでも系統樹を表示してくれましたが、論文やプレゼンの図として利用するには、色々編集を加える必要があります。

この時、良く用いられるツールがiTOLになります。
https://itol.embl.de/

1. 上部の「Upload」へ移動。
2. 先ほど作成したNewickファイルをコピー、またはアップロードする。
3. 右側のメニューから系統樹の表示形式を変えたり、Bootstrap値を表示させる。
4. 必要に応じて系統樹の各ブランチ等をクリックし、色を変更したりする。

系統樹を図にする際には、Bootstrapの結果は必ず分かるようにしてください。
* bootstrap0(SH-aLRT) >= 80%, bootstrap1(UFBoot) >= 95%の場所に色付け or 数値の表示など。

<img src="https://github.com/CropEvol/lecture/blob/master/FFBCexpr_2026spr/images/itol.png?raw=true" height="350px"/>

<h2 id="sec4">4. データベースの活用</h2>

次世代シーケンサーや第3次シーケンサー（ロングリードシーケンサー）が登場して以降、多くの生物でゲノムが解読されるようになってきました。解読されたゲノム配列はDNAデータバンクなどで公開されています。

おもなDNAデータバンク: 
- [NCBI（National Center for Biotechnology Information; アメリカ）](https://www.ncbi.nlm.nih.gov/)
- [DDBJ（DNA Data Bank of Japan; 日本）](https://www.ddbj.nig.ac.jp/index.html)
- [ENA (European Nucleotide Archive; イギリス)](https://www.ebi.ac.uk/ena/browser/home)

実習で扱ったカエデやツツジ、それらの近縁種も代表的な系統のDNA配列が公開されており、今回の解析で利用できます。

<h3>4.1 データベースに登録されている遺伝子の配列データを取得</h3>

今回使用した`rbcL遺伝子`の配列は下記リストの植物種でも公開されています。

取得可能な種の一部を下に載せています。リンクから配列データにアクセスできます。

カエデ近縁種の公開ゲノム配列:  
- 今回採集した種
	- *Acer palmatum*（イロハモミジ）
	- *Acer rufinerve*（ウリハダカエデ）
- matK遺伝子, rbcL遺伝子の配列が公開されているカエデ属の植物種の例:
	- *Acer australe [rbcL](https://www.ncbi.nlm.nih.gov/nuccore/AB872539.1?report=fasta)
	- *Acer carpinifolium [rbcL](https://www.ncbi.nlm.nih.gov/nuccore/AB872541.1?report=fasta)
	- *Acer distylum [rbcL](https://www.ncbi.nlm.nih.gov/nuccore/AB872545.1?report=fasta)
	- *Acer insulare [rbcL](https://www.ncbi.nlm.nih.gov/nuccore/AB872547.1?report=fasta)
	- *Acer japonicum [rbcL](https://www.ncbi.nlm.nih.gov/nuccore/AB872548.1?report=fasta)
	- *Acer maximowiczianum [rbcL](https://www.ncbi.nlm.nih.gov/nuccore/AB872549.1?report=fasta)
	- *Acer micranthum [rbcL](https://www.ncbi.nlm.nih.gov/nuccore/AB872550.1?report=fasta)
	- *Acer miyabei [rbcL](https://www.ncbi.nlm.nih.gov/nuccore/AB872551.1?report=fasta)
	- *Acer morifolium [rbcL](https://www.ncbi.nlm.nih.gov/nuccore/AB872552.1?report=fasta)
	- *Acer nipponicum [rbcL](https://www.ncbi.nlm.nih.gov/nuccore/AB872553.1?report=fasta)
	- *Acer oblongum [rbcL](https://www.ncbi.nlm.nih.gov/nuccore/AB872554.1?report=fasta)
	- *Acer pictum [rbcL](https://www.ncbi.nlm.nih.gov/nuccore/AB872557.1?report=fasta)
	- *Acer ukurunduense [rbcL](https://www.ncbi.nlm.nih.gov/nuccore/AB872565.1?report=fasta)

ツツジ近縁種の公開ゲノム配列
- 今回採集した種
	- *Rhododendron macrosepalum* (モチツツジ)
	- *Lyonia ovalifolia* (ネジキ)
- matK遺伝子, rbcL遺伝子の配列が公開されているカエデ属の植物種の例:
	- *Rhododendron impeditum [rbcL](https://www.ncbi.nlm.nih.gov/nuccore/JF943927.1?report=fasta)
	- *Rhododendron indicum [rbcL](https://www.ncbi.nlm.nih.gov/nuccore/HM850305.1?report=fasta)
	- *Enkianthus perulatus [rbcL](https://www.ncbi.nlm.nih.gov/nuccore/JF941463.1?report=fasta)
	- *Erica carnea [rbcL](https://www.ncbi.nlm.nih.gov/nuccore/KP737713.1?report=fasta)
	- *Lyonia ferruginea [rbcL](https://www.ncbi.nlm.nih.gov/nuccore/AF124584.1?report=fasta)
	- *Lyonia mariana [rbcL](https://www.ncbi.nlm.nih.gov/nuccore/KJ773666.1?report=fasta)
	- *Pieris japonica [rbcL](https://www.ncbi.nlm.nih.gov/nuccore/AB206589.1?report=fasta)
	- *Pieris koidzumiana [rbcL](https://www.ncbi.nlm.nih.gov/nuccore/AB206592.1?report=fasta)
	- *Vaccinium corymbosum [rbcL](https://www.ncbi.nlm.nih.gov/nuccore/KJ773964.1?report=fasta)
	- *Vaccinium angustifolium [rbcL](https://www.ncbi.nlm.nih.gov/nuccore/KJ593742.1?report=fasta)
	- *Vaccinium oxycoccos [rbcL](https://www.ncbi.nlm.nih.gov/nuccore/JN893514.1?report=fasta)

<h3>4.2 データベースに登録されている遺伝子の配列データを取得</h3>

また、得られた配列を基に、類似する配列がデータベースに存在するか検索することも可能です。

データベース全体に対して検索をかけることで、同じ遺伝子に似た配列をイネやトマトなど他の植物種が持っているか調べる事が出来ます。

例えばイロハモミジの`rbcL遺伝子`に類似する別植物種の遺伝子(=orthologと思われる遺伝子)を探す事が出来ます。

ここでは、登録されているイネ(*Oryza sativa*)のゲノム配列からイロハモミジの`rbcL`遺伝子と類似する遺伝子配列を検索してみましょう。

手順:
1. 上記のNCBIのBLASTページ (https://blast.ncbi.nlm.nih.gov/Blast.cgi) に移動する
2. 「Nucleotide BLAST」をクリックする
3. 実習で取得した塩基配列を"Enter Query Sequence"のテキストボックスに貼り付ける  
4. "Choose Search Set"の所のOrganismに*Oryza sativa*と入力する
5. 画面下のほうにある「BLAST」をクリックする
6. 検索結果のうち、上位の結果で配列の長さ(Acc. Len)が数百~数千程度のものをクリックする
7. 「GenBank」をクリックする。
8. 表示されたページの「FASTA」をクリックする

<img src="https://github.com/CropEvol/lecture/blob/master/FFBCexpr_2026spr/images/blast.png?raw=true" height="550px"/>

4.のOrganismを指定しなければ、NCBIに保存されているあらゆる生物種の配列から検索が行われます。

<h2 id="sec5">5. 練習</h2>

では練習として、カエデ担当班は

* シーケンスしたイロハモミジ、ウリハダカエデのrbcL遺伝子の配列
* 上のカエデ近縁種のリストから好きな３種の配列
* BLASTを使用して、イロハモミジ(*Acer palmatum*)の配列から*Aesculus hippocastanum* (トチノキ)の`rbcL遺伝子`の配列を取得

以上の6種の植物種の`rbcL遺伝子`の配列で系統樹を作成してください。

ツツジ担当班は

* シーケンスしたモチツツジ、ネジキのrbcL遺伝子の配列
* 上のツツジ近縁種のリストから好きな３種の配列
* BLASTを使用して、ネジキ(*Lyonia ovalifolia*)の配列から*Actinidia kolomikta* (マタタビ)の`rbcL遺伝子`の配列を取得

以上の6種の植物種の`rbcL遺伝子`の配列で系統樹を作成してください。

トチノキやマタタビは各グループにおける外群(より祖先的な種)になります。
系統樹を可視化する際には、BLAST検索で取得したトチノキやマタタビの配列をRootとして表示してみてください。

<img src="https://github.com/CropEvol/lecture/blob/master/FFBCexpr_2026spr/images/root.png?raw=true" height="350px"/>

発表では上のリストの植物種を全て使用しても良いですし、一部のみを使用してもかまいません。

進化的な関係性と各植物種の形質や生息地などがどの様に関連していそうか、調べてみてください。