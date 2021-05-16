# データセットを用意する

　データセットの用意には、エクセルなどの表計算ソフトを使います。  

　ここでは、Googleアカウントを持っている者なら誰でも利用できるGoogleスプレッドシートを使って、データセットを用意する方法を説明しています（Microsoft Excel等の表計算ソフトでも同様に可能です）。

手順は次の通りです。
1. Googleスプレッドシートを開く
1. Googleスプレッドシートにデータを入力する
1. **カンマ区切りテキストファイル（CSV）** または **タブ区切りテキストファイル（TSV）** として保存する
1. Google Colabにアップロードする

---

## 1. Google Spreadsheetにデータを入力する
1. Google検索ページにある右上アイコン > 「ドライブ」
<img src="./images/gsheet_1.png" height="200" alt="gsheet_1">
1. Googleドライブのページで新規の「Google スプレッドシート」を開きます。
<img src="./images/gsheet_2.png" height="200" alt="gsheet_2">

## 2. Googleスプレッドシートにデータを入力する
　**1行に1サンプル分** のデータを入力します。
<img src="./images/gsheet_3.png" height="200" alt="gsheet_3">

## 3. カンマ区切りテキストファイル（CSV） または タブ区切りテキストファイル（TSV） として保存する
　データをテキストファイル形式で保存します。その際、**カンマ区切り（CSV）** か **タブ区切り (TSV)**を選択してください。
<img src="./images/gsheet_4.png" height="200" alt="gsheet_4">

※ Microsoft Excelを使っている場合、「保存」または「名前を付けて保存」で同様にテキストファイルとして保存できます。
<img src="./images/excel_save_textfile.png" height="200" alt="excel_save_textfile
">

## 4. Google Colabにアップロードする
　解析時には、保存したデータをGoogle Colaboratoryにアップロードする必要があります。

1. 画面左にあるフォルダアイコン > 「アップロード」
1. アップロードするテキストファイルを選択する

<img src="./images/colab_upload.png" height="200" alt="colab_upload
">

　データ解析の準備はこれで完了です。Google Colab上にアップロードされたファイルを、pandasの`read_csv`で読み込んでください。
```python
import pandas as pd
# カンマ区切りファイルの場合
データフレーム変数 = pd.read_csv(ファイル名, sep=",", header=ヘッダー行の番号)
# タブ区切りファイルの場合
データフレーム変数 = pd.read_csv(ファイル名, sep="\t", header=ヘッダー行の番号)
```
