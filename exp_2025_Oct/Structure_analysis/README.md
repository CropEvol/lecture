<a name="section1"></a>
# 生物先端科学コース 学生実験 [2026年度 後期]

## ドメイン予測と構造予測

- 実習資料
    - []()

## アミノ酸配列のドメイン予測

- 候補領域にある遺伝子のアミノ酸配列
    - [candidate_gene.fasta](https://raw.githubusercontent.com/slt666666/lecture_data/refs/heads/main/candidate_gene.fasta)

### InterProScanの結果を確認する

下の結果のページから昨日動かしておいたものを選択。

ドメイン予測の結果を知りたい遺伝子名を選択。

![InterProScan](https://github.com/CropEvol/lecture/blob/master/images/exp_2025_2/InterProScan.png "InterProScan")

ドメイン情報に基づき、NLRをコードする遺伝子を探してみましょう。恐らく４つあるはずです。

## 構造解析 実習テキスト・データセット

- 実習資料
    - [ChimeraXのコマンド集](https://raw.githubusercontent.com/CropEvol/lecture/master/data/261001_ChimeraXコマンド.pdf)
	- [(参考)別行事で使用したAlphaFold3実習のスライド資料](https://raw.githubusercontent.com/CropEvol/lecture/master/data/241128_実習資料.pdf)

- ツールへのリンク
    - [AlphaFold3へのリンク](https://alphafoldserver.com/about)
    - [ChimeraXへのリンク](https://www.cgl.ucsf.edu/chimerax/)
        - Windowsの方はChimeraXは左メニューのDownloadからダウンロード出来ます。
		- Macの方はOther releasesから自分のOSに合ったものを選んでください。

- 配列データ
    - [NRC0 HelperおよびSensorの配列](https://raw.githubusercontent.com/CropEvol/lecture/master/data/NRC0.fasta)
    - [PikpおよびAVR-PikDの配列](https://raw.githubusercontent.com/CropEvol/lecture/master/data/Pikp1_AVR_PikD_pep.fasta)

- AlphaFold3で予測した構造データ(※時間が足りなかった時用。右クリックからリンク先を保存を選んでください。)
    - [AF3_Pikp1_AVRPikD.cif](https://raw.githubusercontent.com/CropEvol/lecture/master/data/AF3_Pikp1_AVRPikD.cif)

- ChimeraXでの解析見本
    - [Pikp1_AVR.cxs](https://raw.githubusercontent.com/CropEvol/lecture/master/data/Pikp1_AVR.cxs)
