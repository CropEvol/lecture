#!/bin/bash
TOOL_DIR="/content/tools"
mkdir -p $TOOL_DIR
cd $TOOL_DIR

## samtools-1.21 from GoogleDrive
FILE_ID="1hKPNXzGgPG_f2CvK87Be4sVx0bLkXXYE";
FILE_NAME="samtools-1.21.tar.gz";
FILE_BASE=`basename -s ".tar.gz" $FILE_NAME`
gdown https://drive.google.com/uc?id=$FILE_ID --no-cookies -O $FILE_NAME
tar -zxf $FILE_NAME
rm -f $FILE_NAME
ln -sf $TOOL_DIR/$FILE_BASE/samtools /usr/bin/

## htslib-1.21 from GoogleDrive
FILE_ID="1-3HEsOQrygyigtQ1M9KKuztYn48CP7W4";
FILE_NAME="htslib-1.21.tar.gz";
FILE_BASE=`basename -s ".tar.gz" $FILE_NAME`
gdown https://drive.google.com/uc?id=$FILE_ID --no-cookies -O $FILE_NAME
tar -zxf $FILE_NAME
rm -f $FILE_NAME
ln -sf $TOOL_DIR/$FILE_BASE/tabix /usr/bin/
ln -sf $TOOL_DIR/$FILE_BASE/bgzip /usr/bin/

## igv-notebook-0.3.1
pip install -q igv-notebook==0.3.1
wget -q -O ../igv_prep.py           https://github.com/CropEvol/lecture/raw/master/textbook_2024/scripts/igv_prep.py
