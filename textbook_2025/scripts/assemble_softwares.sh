#!/bin/bash
TOOL_DIR="/content/tools"
mkdir -p $TOOL_DIR
cd $TOOL_DIR


### 参考：GoogleDriveのファイルをwgetでダウンロードする方法
### https://qiita.com/cv_carnavi/items/1fc8272da135a36598a2
### https://qiita.com/IsHYuhi/items/e4afc0163019343d9664

## igv-notebook-0.3.1 from Github
pip install -q igv-notebook==0.3.1
wget -q -O ../igv_prep.py           https://github.com/CropEvol/lecture/raw/master/textbook_2025/scripts/igv_prep.py

## SPAdes-4.2.0 from GoogleDrive
FILE_ID="1ypx_yKUI3QnJlGHsyuJJg61TWTiZhQTb";
FILE_NAME="SPAdes-4.2.0-Linux.tar.gz";
FILE_BASE=`basename -s ".tar.gz" $FILE_NAME`
gdown https://drive.google.com/uc?id=$FILE_ID --no-cookies -O $FILE_NAME
tar -zxf $FILE_NAME
rm -f $FILE_NAME
ln -sf $TOOL_DIR/$FILE_BASE/bin/spades.py /usr/bin/

## Flye-2.9.6 from GoogleDrive
FILE_ID="14rI7Solj6KZh4YpnSSwUB_97ZgFQMFQB";
FILE_NAME="Flye-2.9.6.tar.gz";
FILE_BASE=`basename -s ".tar.gz" $FILE_NAME`
gdown https://drive.google.com/uc?id=$FILE_ID --no-cookies -O $FILE_NAME
tar -zxf $FILE_NAME
rm -f $FILE_NAME
ln -sf $TOOL_DIR/$FILE_BASE/bin/flye /usr/bin/

## bwa-0.7.17 from GoogleDrive
FILE_ID="10k9fkfIdXuiJ1D2VMt10-Q2ws0APH3mq"; #共有リンクの発行で確認可能
FILE_NAME="bwa-0.7.17.tar.gz";
FILE_BASE=`basename -s ".tar.gz" $FILE_NAME`
gdown https://drive.google.com/uc?id=$FILE_ID --no-cookies -O $FILE_NAME
tar -zxf $FILE_NAME
rm -f $FILE_NAME
ln -sf $TOOL_DIR/$FILE_BASE/bwa /usr/bin/

## samtools-1.21 from GoogleDrive
FILE_ID="1hKPNXzGgPG_f2CvK87Be4sVx0bLkXXYE";
FILE_NAME="samtools-1.21.tar.gz";
FILE_BASE=`basename -s ".tar.gz" $FILE_NAME`
gdown https://drive.google.com/uc?id=$FILE_ID --no-cookies -O $FILE_NAME
tar -zxf $FILE_NAME
rm -f $FILE_NAME
ln -sf $TOOL_DIR/$FILE_BASE/samtools /usr/bin/

## SeqKit v2.5.1 from GoogleDrive
FILE_ID="1JTiW78S0K4H_ag42wy5ojPLWKSR7V3_E";
FILE_NAME="seqkit_linux_amd64.tar.gz";
FILE_BASE=`basename -s ".tar.gz" $FILE_NAME`
gdown https://drive.google.com/uc?id=$FILE_ID --no-cookies -O $FILE_NAME
tar -zxf $FILE_NAME
rm -f $FILE_NAME
ln -sf $TOOL_DIR/seqkit /usr/bin/

## minimap2 v2.28 from GoogleDrive
FILE_ID="1-1To7Dwa_dVuq02Ev48ePSMD146SBpu_";
FILE_NAME="minimap2-2.28_x64-linux.tar.gz";
FILE_BASE=`basename -s ".tar.gz" $FILE_NAME`
gdown https://drive.google.com/uc?id=$FILE_ID --no-cookies -O $FILE_NAME
tar -zxf $FILE_NAME
rm -f $FILE_NAME
ln -sf $TOOL_DIR/$FILE_BASE/minimap2 /usr/bin/

## pipelines
wget -q -O ../Alignment_mm2.sh      https://github.com/CropEvol/lecture/raw/master/textbook_2025/scripts/Alignment_mm2.sh
