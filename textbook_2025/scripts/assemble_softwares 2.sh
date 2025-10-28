#!/bin/bash
TOOL_DIR="/content"

wget -q -O Alignment_bwa.sh https://github.com/CropEvol/lecture/raw/master/textbook_2025/scripts/Alignment_bwa.sh
wget -q -O Alignment_mm2.sh https://github.com/CropEvol/lecture/raw/master/textbook_2025/scripts/Alignment_mm2.sh
wget -q -O Polishing.sh     https://github.com/CropEvol/lecture/raw/master/textbook_2025/scripts/Polishing.sh

pip install -q igv-notebook==0.3.1
wget -q -O igv_prep.py  https://github.com/CropEvol/lecture/raw/master/textbook_2025/scripts/igv_prep.py

apt install miniasm >/dev/null
apt install spades >/dev/null
apt install seqkit >/dev/null
apt install bwa  >/dev/null
apt install minimap2 >/dev/null
apt install samtools >/dev/null
apt install bcftools >/dev/null
apt install pilon >/dev/null

FILE_ID="14rI7Solj6KZh4YpnSSwUB_97ZgFQMFQB";
FILE_NAME="Flye-2.9.6.tar.gz";
FILE_BASE=`basename -s ".tar.gz" $FILE_NAME`
gdown https://drive.google.com/uc?id=$FILE_ID --no-cookies -O $FILE_NAME
tar -zxf $FILE_NAME
rm -f $FILE_NAME
ln -sf $TOOL_DIR/$FILE_BASE/bin/flye /usr/bin/

echo '... completed'

### 参考：GoogleDriveのファイルをwgetでダウンロードする方法
### https://qiita.com/cv_carnavi/items/1fc8272da135a36598a2
### https://qiita.com/IsHYuhi/items/e4afc0163019343d9664