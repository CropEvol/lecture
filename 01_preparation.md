# 01. ゲノム情報学入門の準備
　次世代シークエンサーで研究対象の生物のゲノム配列を読んだ場合、シークエンサーからは非常に大きなサイズのデータが得られます。その大量のデータを扱うためには、ゲノム解析の知識だけでなく、UNIXと呼ばれるパソコン操作やプログラミングがどうしても必要になってきます。本講義の演習では、各自のパソコンを使って、ゲノム解析の基盤となる知識や技術を勉強していきます。これから学ぶこと（とくにプログラミング）は、研究以外の様々な場面でも、みなさんを助けてくれるでしょう。  

　はじめに、演習で使う解析環境を準備していきます。作業は次の5つです。
- パソコンの情報確認
- パソコンの設定変更
- テキストエディタのインストール  
- Pythonのインストール  
- Rのインストール  

---
## 1. パソコンの情報確認
　自身のパソコンのスペック情報を確認しましょう。

### Windowsの場合  
[Windows 10 / 8.1 / 8]  
0. スタートボタン（左下のWindowsロゴ）
0. 設定（図1）
0. システム（図2）
0. バージョン情報（図3）

[Windows 7]  
0. スタートボタン（左下のWindowsロゴ）
0. コンピュータを右クリック
0. プロパティ

パソコンの情報画面が開いたら、次の項目を確認しましょう（図3）。
- Windowsのエディション：Windows 10 / 8.1 / 8 / 7 など
- システムの種類：32ビット / 64ビット
- メモリ（RAM）：？GB

<img src="./images/01/win_info01.png" width="400px" alt="Win/information01">  
図1. [Windows 10] 情報確認手順1

<img src="./images/01/win_info02.png" width="600px" alt="Win/information02">  
図2. [Windows 10] 情報確認手順2

<img src="./images/01/win_info03.png" width="600px" alt="Win/information03">  
図3. [Windows 10] 情報確認手順3


### Macの場合
0. メニューバーのアップルロゴ > このMacについて（図4）

　情報画面が開いたら、次の項目を確認しましょう。
- macOS：Sierra / El Capitan / Yosemite など
- バージョン：XX.YY.ZZ

<img src="./images/01/mac_info.png" width="600px" alt="Mac/information">  
図4. [MacOS] 情報確認

---
## 2. パソコンの設定変更
　演習を円滑に進めるために、いくつかの設定を変更しましょう。

### Windowsの場合  
　ファイルの拡張子の非表示を「表示」に変更します。  

[Windows 10 / 8.1 / 8]  
0. 適当なフォルダを開きます。
0. 上部にある「表示」タブ（図5）
0. ファイル名拡張子にチェックを入れます（図5）  

[Windows 7]
0. 適当なフォルダを開きます
0. 左上付近にある「整理」
0. フォルダと検索のオプション
0. 表示
0. 「登録されている拡張子は表示しない」のチェックを外します

<img src="./images/01/win_setting.png" width="600px" alt="Win/setting">  
図5. [Windows 10] ファイル名拡張子の表示

### Macの場合  
　ターミナルのカーソル移動速度を早くします。  
0. システム環境設定 > キーボード > 以下のように変更（図6）  
(1)「キーのリピート」を"速い"  
(2)「リピート入力認識までの時間」を"短い"

<img src="./images/01/mac_setting.png" width="600px" alt="Mac/setting">  
図6. [Mac] ターミナルのカーソル移動速度の変更

---
## 3. テキストエディタのインストール
　テキストエディタとは、Microsoft Wordよりも簡易で、文章等を書くことに特化したソフトウェアです。プログラムを書く時に使います。  
（すでに何らかのテキストエディタをインストールしている人は、ここを飛ばしても構いません。）  

### Windowsの場合
　サクラエディタをインストールします。
0. サクラエディタ公式ページ（[http://sakura-editor.sourceforge.net/download.html](http://sakura-editor.sourceforge.net/download.html)）へ
0. V2(Unicode版)をダウンロード（図7）
0. ダウンロードしたファイル（.exe）をダブルクリック
0. 特に何も変更せず進み、インストール
※「追加タスクの選択」で "デスクトップにアイコンを追加" にチェックを入れておくと便利です。
0. 完了

<img src="./images/01/win_sakura_download.png" width="600px" alt="Win/download text-editer">  
図7. [Windows] サクラエディタのダウンロード

サクラエディタ以外のテキストエディタ
- TeraPad（[http://www5f.biglobe.ne.jp/~t-susumu/library/tpad.html](http://www5f.biglobe.ne.jp/~t-susumu/library/tpad.html)）
- Notepad++（[https://notepad-plus-plus.org/](https://notepad-plus-plus.org/)）
- Atom（[https://atom.io/](https://atom.io/)）※ 動作は重いが高機能

### Macの場合
　miをインストールします。
0. miのダウンロードページ（[https://www.mimikaki.net/download/index.html](https://www.mimikaki.net/download/index.html)）から最新版をダウンロード（図8）
0. ダウンロードしたファイルをダブルクリック
0. miアイコンをApplicationsにドラッグ

<img src="./images/01/mac_mi_download.png" width="600px" alt="Mac/download text-editer">  
図8. [Mac] miのダウンロード

mi以外のテキストエディタ
- Sublime Text（[http://www.sublimetext.com/](http://www.sublimetext.com/)）
- CotEditor（[https://coteditor.com/](https://coteditor.com/)）
- Atom（[https://atom.io/](https://atom.io/)）

---
## 4. Pythonのインストール
　講義では「Python」プログラミング言語を使います。  
　ここではAnacondaとよばれる環境を使って、Pythonをインストールします。

### Windowsの場合
0. Anacondaのダウンロードページ（[https://www.anaconda.com/download/](https://www.anaconda.com/download/)）へ
0. 「Python 3.6 version」をダウンロード（図9）  
__※ [1. パソコンの情報確認]で調べたシステムの種類（32ビット or 64ビット）に合うものをダウンロードしてください。__
0. ダウンロードしたファイル（.exe）をダブルクリック
0. Advanced Optionの1箇所以外、特に変更せず進み、インストール  
__※「Add Anaconda to my PATH environment variable」にチェックを入れてください（図10）__
0. 完了

<img src="./images/01/win_anaconda_download.png" width="600px" alt="Win/download python">  
図9. [Windows] Anacondaのダウンロード

<img src="./images/01/win_anaconda_install.png" width="600px" alt="Win/install python">  
図10. [Windows] Anacondaのインストール注意点

### Macの場合
0. Anacondaのダウンロードページ（[https://www.anaconda.com/download/](https://www.anaconda.com/download/)）へ
0. 「Python 3.6 version（64-Bit Graphical Installer）」をダウンロード（図11）
0. ダウンロードしたファイルをダブルクリック
0. 特に何も変更せず進み、インストール
0. 完了

<img src="./images/01/mac_anaconda_download.png" width="600px" alt="Mac/download python">  
図11. [Mac] Anacondaのダウンロード

---
## 5. Rのインストール
　「R」は統計解析によく使われるソフトウェアおよびプログラミング言語です。

### Windowsの場合
0. Rのダウンロードページ（[https://cloud.r-project.org/](https://cloud.r-project.org/)）へ
0. 「Download R for Windows」（図12）>「base」>「Download R 3.4.1 for Windows」
0. ダウンロードしたファイルをダブルクリック
0. 特に何も変更せず進み、インストール
0. 完了

### Macの場合
0. Rのダウンロードページ（[https://cloud.r-project.org/](https://cloud.r-project.org/)）へ
0. 「Download R for (Mac) OS X」（図12）> 最新版の「R-X.Y.Z.pkg」  
※ 2017年9月10日現在ではR-3.4.1が最新版
0. ダウンロードしたファイルをダブルクリック
0. 特に何も変更せず進み、インストール
0. 完了

<img src="./images/01/both_r_download.png" width="600px" alt="Win&Mac/download R">  
図12. [Windows/Mac] Rのダウンロード
