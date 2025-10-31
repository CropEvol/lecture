#!/bin/bash
TOOL_DIR="/content/tools"
mkdir -p $TOOL_DIR
cd $TOOL_DIR

## igv-notebook-0.3.1
pip install -q igv-notebook==0.3.1
wget -q -O ../igv_prep.py https://github.com/CropEvol/lecture/raw/master/textbook_2024/scripts/igv_prep.py

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
