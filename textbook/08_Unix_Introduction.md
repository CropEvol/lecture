# Unix入門

## Unixとゲノム解析
　パソコンには、**オペレーティング・システム (OS)** というものが入っています。みなさんのパソコンには、Windows10/8.1/8/7やmacOSといったOSが入っています（それ以外のOSをパソコンに入れている方には、この解説は不要でしょう）。OSは、パソコン全体を管理・制御するソフトウェアです。マウスやキーボードなどによる入力を受け取り、解釈し、その情報をCPU（演算装置）で計算させたり、メモリ（短期記憶媒体）に一時保存させたり、ハードディスク（長期記憶媒体）に保存するよう命令しています。キーボードの`A`を押せばモニタに`A`と表示されるのも、キーボードとモニタのあいだの処理をOSがうまく中継しているからです（この中継役は、実際には、OSを構成している __カーネル__ と呼ばれるものがおこなっています）。

<div style="margin-bottom: 5px;"><img src="../images/08/os.png" height="120px" alt="what is os"></div>

　UnixはOSの一種です。Unixに似たLinuxというOSもあります。その違いについては、ここでは詳しく説明しませんが、UnixもLinuxも同じような仕組みで動いており、操作するコマンドもほとんどが同じです。以下では、UnixとLinuxをまとめて、「Unixシステム」または単に「Unix」と表現しています。

　ここで重要なことは、<u>ゲノム解析で使われる多くのソフトウェアは、Unixシステムで動くように作られており、ターミナル（黒い画面）を使ってソフトウェアを実行しなければならない</u>、ということです。また、ゲノム解析にはスーパーコンピュータ（スパコン）を使わなければできないような処理もあり、<u>そのスパコンもUnixシステムが使われています</u>。つまり、ゲノム解析には、Unixの操作がほぼ必須です。

　今回は、演習しながらUnixシステムについて学んでいきます。  

_WindowsはUnix系OSではありませんが、WindowsパソコンでUnixシステムの操作を学べるよう「Git for Windows」というソフトをインストールしてもらいました。_

<div style="page-break-before:always"></div>

## Unixシステムの基本

　サンプルデータはこちらにあります。以下をクリックすれば `L08_samples.zip` がダウンロードできます。  
　ダウンロード後、ZIPファイルの解凍（展開）先としてデスクトップ上の `genome`（授業用フォルダ）を指定して、解凍してください。
[https://github.com/CropEvol/lecture/raw/master/data/L08_samples.zip](https://github.com/CropEvol/lecture/raw/master/data/L08_samples.zip)

### ディレクトリ構造
　Unixシステムでは、フォルダのことを __ディレクトリ__ と呼んでいます。ディレクトリの構造は、最も根元のディレクトリ（ __ルートディレクトリ`/`__ ）から枝分かれした、Tree状の階層構造になっています。  

<div style="margin-bottom: 5px;"><img src="../images/08/unix_dirtree.png" height="200px" alt="unix directory"></div>

　Windowsの場合、CドライブやDドライブなどがルートディレクトリに相当します。こちらも階層構造になっています。  

<div style="margin-bottom: 5px;"><img src="../images/08/win_dirtree.png" height="200px" alt="win directory"></div>

<div style="page-break-before:always"></div>

### パス
　パスとは、ファイルやディレクトリ（フォルダ）の所在地を示すものです。上の図では3つの `dna.txt` と 1つの `rna.txt` があります。それらのファイルのパスは、次のように表されます。  

```text
/Users/mozume/Desktop/genome/dna.txt
/Users/mozume/Desktop/genome/rna.txt
/Users/mozume/Desktop/genome/AAA/dna.txt
/Users/mozume/Desktop/dna.txt

/(スラッシュ)はディレクトリの区切りを表します。

========

[Windowsの場合]
C:¥Users¥mozume¥Desktop¥genome¥dna.txt
C:¥Users¥mozume¥Desktop¥genome¥rna.txt
C:¥Users¥mozume¥Desktop¥genome¥AAA¥dna.txt
C:¥Users¥mozume¥Desktop¥dna.txt

Windowsの場合、ディレクトリの区切りは¥(円マーク)で表します。
ただし、Pythonプログラムでは、/(スラッシュ)を使い、Unixシステムのような書き方をします。
/C/Users/mozume/Desktop/genome/dna.txt
```

このように、ルートディレクトリから始まるパスの書き方を __絶対パス__ といいます。

　パスの別の表現方法として __相対パス__というのもあります。こちらは、あるディレクトリ（フォルダ）を起点とした場合の所在地です。通常、「あるディレクトリ」は自身が今いるディレクトリ（プログラム視点で見た場合、そのプログラムが起動しているディレクトリ）をさします。

```text
/Users/mozume/Desktop/genome から各ファイルへのパス

./dna.txt
./rna.txt
./AAA/dna.txt
../dna.txt

.(ピリオド1つ)は、「起点となるディレクトリ」を意味します。
「./」は省略可能です。

..(ピリオド2つ)は、「ひとつ上のディレクトリ」を意味します。
```

　プログラムでファイルの読み込みをする場合で、このパスが重要になってきます。ファイルのパスを正しくを指定しないと、プログラムはそのファイルを認識できず読み込めません。  
　これまでの演習では、プログラム（`.ipynb`という拡張子がついたファイル）と読み込みたいファイルを同じフォルダに置いていたため、ファイル名を指定するだけで読み込みができていました。もし、プログラムと読み込みファイルが別々のフォルダにあった場合でも、プログラムにファイルのパスをきちんと指定することで、読み込みが可能です。

　パスを指定したファイル読み込みの練習をしてみましょう。Jupyter Notebookを開き、先ほど解凍した `L08_samples` フォルダの中の `cddir/LearnPath.ipynb` を開いてください。
　`cddir`内のファイル構造は下記のようになっています。開いたノートブックの指示にしたがい、各所の`iamin.txt` を読み込んでください。

```text
─── L08_samples ─── cddir ─── dir1 ─── subdir1 ─── iamin.txt
 │               │         │        │
 │               │         │        ├─ subdir2 ─── iamin.txt
 │               │         │        │
                 │         │        ├─ subdir3 ─── iamin.txt
                 │         │        │
                 │         │        └─ iamin.txt
                 │         │
                 │         ├─ dir2 ─── subdir1 ─── iamin.txt
                 │         │        │
                 │         │        ├─ subdir2 ─── iamin.txt
                 │         │        │
                 │         │        ├─ subdir3 ─── iamin.txt
                 │         │        │
                 │         │        └─ iamin.txt
                 │         │
                 │         ├─ dir3 ─── subdir1 ─── iamin.txt
                 │         │        │
                 │         │        ├─ subdir2 ─── iamin.txt
                 │         │        │
                 │         │        ├─ subdir3 ─── iamin.txt
                 │         │        │
                 │         │        └─ iamin.txt
                 │         │
                 │         ├─ iamin.txt
                 │         │
                 │         └─ LearnPath.ipynb
                 │
                 ├─ iamin.txt
```

<div style="page-break-before:always"></div>

### Unixコマンド
　Unixコマンドとは、Unixシステムを操作するコマンドです。マウスポインタ使って操作していた作業（フォルダを開くなど）を、文字入力（コマンド）でおこなってみましょう。  

_マウスポインタを使うような操作を **GUI (Graphical User Interface)** といいます。一方、コマンドでの操作方法を **CUI (Character User Interface)** といいます。_

　現在開いているJupyter Notebookは閉じて、 `genome`フォルダで、ターミナル/Git Bashを開いてください。

```bash
pwd                     # 現在いるフォルダ（ディレクトリ）を確認
ls                      # フォルダ内のファイルやフォルダを確認
cd L08_samples          # L08_samplesまで移動
pwd                     # L08_samplesにいることを確認
cd ..                   # ひとつ上のフォルダに移動
pwd                     # 元のフォルダにいることを確認
cd L08_samples/cddir    # L08_samples/cddirまで移動

########################
# 以下cddirで作業する #
########################
pwd                     # L08_samples/cddirにいることを確認
ls                      # 確認
cat iamin.txt           # ファイルの中身を表示する
ls dir1                 # 別のフォルダのファイルやフォルダを確認
cat dir1/iamin.txt      # 別のフォルダのファイルの中身を表示
cat ../iamin.txt        # 上のフォルダのファイルの中身を表示
ls                      # （ファイルコピー前の確認）
mv iamin.txt example.txt    # ファイルのコピーを作成する
ls                      # （ファイルコピー後の確認）
mkdir dir4              # フォルダを作成する
ls                      # （フォルダ作成後の確認）
ls dir4                 # dir4の中身
mv example.txt dir4     # ファイルを移動
ls                      # （ファイル移動後の確認）
ls dir4                 # dir4/example.txtを確認

cd ../fastadir          # fastadirに移動

########################
# 以下fastadirで作業する #
########################
pwd                     # 現在のフォルダ確認
ls                      # フォルダの中身を確認
cat randseq1.fasta      # ファイルの中身を画面に出力
less randseq1.fasta     # ファイルの中身を見る（qキーで元に戻る）
                        # ターミナルに出力されていないことを確認
grep '>' randseq1.fasta # '>'がある行のみ表示（配列名の行のみ表示）
grep 'CTGCAG' randseq1.fasta    # 検索語がある行のみ表示

# 1回目のgrep出力結果をさらにgrepで文字列検索
grep '>' randseq1.fasta | grep '2'

# 上と同じ出力結果をlessコマンドでで見る
grep '>' randseq1.fasta | grep '2' | less

# 上と同じ出力結果をファイルに保存
grep '>' randseq1.fasta | grep '2' > name.txt
less name.txt           # 中身確認

# 同じファイルに追加書き込み
grep '>' randseq1.fasta | grep '5' >> name.txt
less name.txt           # 中身確認

# 上書き
grep '>' randseq1.fasta | grep '9' > name.txt
less name.txt           # 中身確認

rm name.txt             # ファイル削除

# ファイルを連続して出力（すぐに流れてしまうので、lessで確認）
cat randseq1.fasta randseq2.fasta randseq3.fasta | less
# その出力結果をファイルに保存（3つのファイルを1つにまとめる）
cat randseq1.fasta randseq2.fasta randseq3.fasta > merge.fasta

cd ../lsdir             # lsdirに移動

#####################
# 以下lsdirで作業する #
#####################
pwd                     # 現在のフォルダ確認
ls                      # フォルダの中身を確認
ls -l                   # リスト形式で表示
ls -a                   # .(ドット)から始まるファイルも表示
ls -al                  # 2つのオプションの併用
ls -al | grep '.txt'    # 拡張子が.txtのファイルのみ表示
ls -al | grep '.csv'    # 拡張子が.csvのファイルのみ表示
ls -al | grep '.tsv'    # 拡張子が.tsvのファイルのみ表示
```

　以下には、ゲノム解析でよく使うUnixコマンドをリストアップしています。

| コマンド | 使い方 | 動作 | 備考（単語の意味など） |
|:---|:---|:---|:---|
|pwd|`pwd`|現在いるフォルダのパスを表示する| print working directory の略 |
|ls |`ls`|現在のフォルダにあるファイルやフォルダを表示する| list の略 |
||`ls -l`|現在のフォルダにあるファイルやフォルダをリスト形式で表示する||
||`ls -a`|現在のフォルダにあるファイルやフォルダの所有者や権限なども一緒に表示する||
||`ls -a -l`|`ls -l`と`ls -a`の併用。`ls -al`でも可||
|cd|`cd フォルダ名`|指定したフォルダに移動する||
||`cd ..`|上のフォルダに移動する| change directory の略 |
||`cd`|ホームフォルダ（ホームディレクトリ）に移動する||
|cat|`cat ファイル名`|指定ファイルの中身を出力する| concatenate の略<br>本来はファイルを結合するコマンド |
|head|`head ファイル名`|指定ファイルの最初の10行を出力する||
||`head -n 20 ファイル名`|指定ファイルの最初の20行を出力する||
|tail|`tail ファイル名`|指定ファイルの最後の10行を出力する||
||`tail -n 20 ファイル名`|指定ファイルの最後の20行を出力する||
|grep|`grep '検索ワード' ファイル名`|検索ワードについて、指定ファイルの中身を調べ、ヒットした行を出力する| globally search a regular expression and print の略 |
|less|`less ファイル名`|指定ファイルの中身を見る（コマンドラインへの出力はしない）<br>__[重要] サイズの大きいファイルの中を確認するときによく使います。__　| `more`コマンドの逆 |
|wc|`wc ファイル名`|指定ファイルの文字数や行数を調べる| word count の略 |
|mv|`mv ファイル名（フォルダ名） フォルダのパス`|指定ファイル・フォルダを、指定パスに移動する| move の略 |
||`mv 元ファイル名 新規ファイル名`|指定ファイルのコピーを作成し、新しい名前をつける||
|touch|`touch ファイル名`|新規ファイルを作成する| 本来はファイルのタイムスタンプを変更するコマンド |
|rm|`rm ファイル名`|指定ファイルを削除する| remove の略 |
||`rm -R フォルダ名`<br>`rmdir フォルダ名`|指定フォルダを削除する||
|mkdir|`mkdir フォルダ名`|新規フォルダを作成する| make directory の略 |
|>|`コマンド > ファイル名`|ファイルに出力結果を書き込む（上書き）| __リダイレクション__ と呼ばれる機能 |
|>>|`コマンド > ファイル名`|ファイルに出力結果を書き込む（追加書き込み）| __リダイレクション__ と呼ばれる機能 |
|&#124;|`コマンド1` &#124; `コマンド2`| コマンド1の結果をコマンド2に渡す | __パイプ__ と呼ばれる機能 |

_他にも多くのコマンドがあるので、興味があれば調べてください。_

<div style="page-break-before:always"></div>

### シェルスクリプト（Bash）
　シェルスクリプトはプログラミング言語のひとつです。この言語は、ファイル・ディレクトリ操作のようなパソコン操作を得意とする言語です。もう少し具体的に言うと、上で学んだUnixコマンドをコード中に記述し実行できます。つまり、定型的なパソコン操作なら自動化することが可能です。また、他の言語で書かれたプログラムの実行も容易に可能なため、ゲノム解析では大量のファイルを扱う際にシェルスクリプトをよく使います。

<div style="margin-bottom: 5px;"><img src="../images/08/shellscript.png" height="200px" alt="shellscript"></div>

　`L08_samples/manydir`内に、FASTAファイル中の各配列のA,T,G,C,Nの数をカウントするPythonプログラム `count_ATGCN.py` と50個のFASTAファイル（seq_001.fasta ~ seq_050.fasta）を置いています。このプログラムの使い方は、 `python count_ATGCN.py [FASTAファイル]` です。試しに一つのFASTAファイルに対して実行してみましょう。  

*これまでは、Jupyter Notebook上でプログラム作成と実行をしていましたが、このようにターミナルでもPythonプログラムを実行することもできます。 `count_ATGCN.py` の中身については適宜確認してください。*

```bash
python count_ATGCN.py seq_001.fasta
```

　ターミナルに `配列名 A塩基数 T塩基数 G塩基数 C塩基数 N塩基数`  が表示されます。これを50個のファイルに対して実行し、結果をファイルに保存しましょう。

```bash
python count_ATGCN.py seq_001.fasta
# 結果をコピーして、ファイルに貼り付け
python count_ATGCN.py seq_002.fasta
# 結果をコピーして、ファイルに貼り付け
python count_ATGCN.py seq_003.fasta
# 結果をコピーして、ファイルに貼り付け
...
```

　「seq_XXX.fastaの部分を001〜050に順番に変更して実行し、実行毎に結果をコピー、エディタにペーストする」だけの作業ですが、明らかに面倒な作業です。この作業をプログラムにすれば、一回の実行で全部処理できます。  
　今回は、上の作業を全て行うシェルスクリプト `run_auto.sh` をあらかじめ準備しています。 `run_auto.sh` には下記のようなプログラムが書かれています。

```bash
cat /dev/null > result01.txt    # 空の出力ファイルを作成

# 1から50の数字を順に発生させ、iという変数に入れる
for i in {1..50};do
    j=`printf '%03d' $i`    # 数字が3桁になるよう、0埋め（ゼロパディング）する

    python count_ATGCN.py seq_${j}.fasta | tee -a result01.txt
    # 変数jに入っている0埋め後の数字を使い、FASTAファイル名を完成させる
    # Pythonプログラムの実行。結果をパイプで次のコマンドに渡す
    # teeコマンドでファイル書き込み（追加書き込みモード）＆画面出力を同時におこなう
done
```

　ターミナルに `bash run_auto.sh`と入力し、実行してください。  

_シェルスクリプトには、bash, zsh, cshなどいくつか種類があります。今回は広く使われているbashを使っています。  
`bash プログラムファイル`は、Bashプログラムファイル（拡張子.shがよく使われる）を実行するコマンドです。_

　50個のファイルを処理できましたか？ プログラムの詳細な解説はしませんが、シェルスクリプトを使えば、複数ファイルに対して同じ処理を繰り返す作業を簡単に自動化できます。

　シェルスクリプトとPythonはどちらも1ファイルの複雑な処理をすることは可能ですし、複数ファイルの処理も可能です。グラフ描画もできます。ただし、得意・不得意があるため、私たちの研究グループでは、ゲノム解析にどちらも使っています。1つのファイルの高度なデータ処理については既存のソフトウェアやPythonプログラム、次回以降勉強するRプログラムでおこない、それらの実行をシェルスクリプトで管理して複数ファイル処理する、という使い方をしています。

- Pythonは、1ファイル内の大規模データ処理を得意とし、容易に計算やグラフ描画できる。
- シェルスクリプトは、ファイル・ディレクトリ操作やプログラム実行などのパソコン操作を得意とし、簡単に複数ファイルを扱える。

---

<div style="page-break-before:always"></div>

## 大規模データ解析入門/Unix入門のまとめ
- Pythonを使うと大規模データを処理し、グラフ描画できる
- Unixシステムはコマンドで操作(CUI操作)できる
- シェルスクリプトを使うとCUI操作を自動化し、多量のファイルを処理できる

---

## 課題
- Web版（[課題ページ](./08_Problem.md) へ）
- 配布プリント（12ページ）
