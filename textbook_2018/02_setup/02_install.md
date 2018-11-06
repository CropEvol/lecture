# ゲノム情報解析入門の準備 [補足]
実習では、オンライン解析環境を使用しますが、自分のパソコンにソフトウェアをインストールして、解析環境を構築することも可能です。  

以下ではその構築方法例を紹介します。  

- パソコンの情報確認・設定変更、Pythonのインストール
	- [Windows 10 / 8.1 / 8](#section1) の場合
	- [Windows 7](#section2) の場合
	- [Mac](#section3) の場合


- テキストのダウンロード
	- [テキストのダウンロード](#section4)


- Jupyter Notebookの起動
	- [Jupyter Notebookの起動](#section5)

---
<a name="section1"></a>
## Windows 10 / 8.1 / 8
### 1 パソコン情報の確認
1. 「スタートボタン」（左下のWindowsロゴ）
1. 「設定」
1. 「システム」
1. 「バージョン情報」

<div style="margin-bottom: 5px;"><img src="https://github.com/CropEvol/lecture/blob/master/images/02/win_info01.png" width="400px" alt="Win/information01"></div>

<div style="margin-bottom: 5px;"><img src="https://github.com/CropEvol/lecture/blob/master/images/02/win_info02.png" width="400px" alt="Win/information02"></div>

パソコンの情報画面が開いたら、次の項目を確認しましょう。  
- Windowsの種類: 10 / 8.1 / 8 など
- システムの種類：32ビット / 64ビット
- メモリ（RAM）：？GB

<div style="margin-bottom: 5px;"><img src="https://github.com/CropEvol/lecture/blob/master/images/02/win_info03.png?raw=true" width="400px" alt="Win/information03"></div>

### 2 パソコンの設定変更
ファイル拡張子（.txtなど）が表示されるように変更します。
1. 適当なフォルダを開く
1. 上部にある「表示」タブ
1. 「ファイル名拡張子」にチェック

<div style="margin-bottom: 5px;"><img src="https://github.com/CropEvol/lecture/blob/master/images/02/win_setting.png" width="400px" alt="Win/setting"></div>

<a name="python_install_win"></a>
### 3 Pythonのインストール
Anacondaとよばれるツールを使って、Pythonをインストールします。
1. Anacondaの[ダウンロードページ](https://www.anaconda.com/download/)
1. Python version3 の「64-Bit Graphical Installer」をダウンロード  
__※ 32ビットパソコンの場合、「32-Bit Graphical Installer」をダウンロード  __
1. ダウンロードしたファイル（.exe）をダブルクリック
1. 画面に従って進む
	1. Select Installation Type: 「All Users」
	1. Choose Install Location: 何もせずに「Next」
	1. Advanced Installation Options:
		- 「Add Anaconda to my PATH environment variable」にチェック
		- 「Resister Anaconda as my default Python 3.5」にチェック
1. 完了

<div style="margin-bottom: 5px;"><img src="https://github.com/CropEvol/lecture/blob/master/images/02/win_anaconda_install.png" width="400px" alt="Win/install python"></div>  


---
<a name="section2"></a>
## Windows 7
### 1. パソコン情報の確認
1. 「スタートボタン」（左下のWindowsロゴ）
1. 「コンピュータ」を右クリック
1. 「プロパティ」

パソコンの情報画面が開いたら、次の項目を確認しましょう。  
- Windowsの種類: 7
- システムの種類：32ビット / 64ビット
- メモリ（RAM）：？GB

### 2 パソコンの設定変更
ファイル拡張子（.txtなど）が表示されるように変更します。
1. 適当なフォルダを開く
1. 左上付近にある「整理」
1. 「フォルダと検索のオプション」
1. 「表示」
1. 「登録されている拡張子は表示しない」のチェックを外す

### 3 Pythonのインストール
[Windows 10 / 8.1 / 8と同じ](#python_install_win)

---
<a name="section3"></a>
## Mac
### 1. パソコン情報の確認
1. メニューバーの「アップルロゴ」 > 「このMacについて」

情報画面が開いたら、次の項目を確認しましょう。
- macOS：Sierra / El Capitan / Yosemite など
- バージョン：XX.YY.ZZ

### 2 Pythonのインストール
#### Pythonのインストール（簡易版）
1. Anacondaの[ダウンロードページ](https://www.anaconda.com/download/)
1. Python version3 の「64-Bit Graphical Installer」をダウンロード
1. ダウンロードしたファイルをダブルクリック
1. 特に何も変更せず進み、インストール
1. 完了

#### Pythonのインストール（本格的に勉強したい人向け）
__この方法を使ってインストールすれば、異なるバージョンのpythonもインストール＆適宜切り替えることができます。__

1. [Homebrew公式ページ](https://brew.sh/index_ja.html)
1. Homebrew公式ページの「このスクリプトをターミナルに貼り付け実行して下さい。」が示すスクリプト一行をコピー
1. ターミナルを開き、コピーしたスクリプトを貼り付けて、実行
1. 続いて、ターミナルに次の1行をコピーして貼り付け
```bash
brew install pyenv
```

1. ターミナルに次の3行をコピーして貼り付け
```bash
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
```

1. ターミナルを一度閉じ、再度開きます
1. ターミナルに以下を入力し、最新版のanaconda3を確認
```bash
pyenv install -l | grep anaconda3
```

1. 最新版のバージョンを入力してインストール
```bash
pyenv install anaconda3-4.3.1
```

1. 最後に、ターミナルに以下を入力して完了です
```bash
pyenv global anaconda3-4.3.1
```

---
<a name="section4"></a>
## テキストのダウンロード
1. [GitHubページ](https://github.com/CropEvol/lecture.git)
1. 右の方にある「Clone or download」 > 「Download ZIP」
1. ダウンロードしたファイルを展開する

__テキストは毎週更新されます。その都度ダウンロードしてください。__

---
<a name="section5"></a>
## Jupyter Notebookの起動
1. スタートボタン
2. 「すべてのプログラム」
3. 「Anaconda3」 > 「Jupyter Notebook」
4. ダウンロードしたフォルダに移動する  
「textbook_2018」という名前のフォルダにテキストが入っています。
