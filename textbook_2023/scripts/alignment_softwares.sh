#!/bin/bash
TOOL_DIR="/content/tools"
mkdir -p $TOOL_DIR
cd $TOOL_DIR

## bwa-0.7.17 from GoogleDrive
FILE_ID="10k9fkfIdXuiJ1D2VMt10-Q2ws0APH3mq";
FILE_NAME="bwa-0.7.17.tar.gz";
FILE_BASE=`basename -s ".tar.gz" $FILE_NAME`
CONFIRM=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate "https://drive.google.com/uc?export=download&id=$FILE_ID" -O- | sed -En 's/.*confirm=([0-9A-Za-z_]+).*/\1/p');
wget -q --load-cookies /tmp/cookies.txt "https://drive.google.com/uc?export=download&confirm=$CONFIRM&id=$FILE_ID" -O $FILE_NAME;
rm -f /tmp/cookies.txt
tar -zxf $FILE_NAME
rm -f $FILE_NAME
ln -sf $TOOL_DIR/$FILE_BASE/bwa /usr/bin/

## samtools-1.17 from GoogleDrive
FILE_ID="1fGKLLtAaJmTHAc4uGRtb_0r-HB2M6yQv";
FILE_NAME="samtools-1.17.tar.gz";
FILE_BASE=`basename -s ".tar.gz" $FILE_NAME`
CONFIRM=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate "https://drive.google.com/uc?export=download&id=$FILE_ID" -O- | sed -En 's/.*confirm=([0-9A-Za-z_]+).*/\1/p');
wget -q --load-cookies /tmp/cookies.txt "https://drive.google.com/uc?export=download&confirm=$CONFIRM&id=$FILE_ID" -O $FILE_NAME;
rm -f /tmp/cookies.txt
tar -zxf $FILE_NAME
rm -f $FILE_NAME
ln -sf $TOOL_DIR/$FILE_BASE/samtools /usr/bin/

## htslib-1.17 from GoogleDrive
FILE_ID="1CCEDZzrpVR5WYpWkvbVyQZ4UHlerLXNO";
FILE_NAME="htslib-1.17.tar.gz";
FILE_BASE=`basename -s ".tar.gz" $FILE_NAME`
CONFIRM=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate "https://drive.google.com/uc?export=download&id=$FILE_ID" -O- | sed -En 's/.*confirm=([0-9A-Za-z_]+).*/\1/p');
wget -q --load-cookies /tmp/cookies.txt "https://drive.google.com/uc?export=download&confirm=$CONFIRM&id=$FILE_ID" -O $FILE_NAME;
rm -f /tmp/cookies.txt
tar -zxf $FILE_NAME
rm -f $FILE_NAME
ln -sf $TOOL_DIR/$FILE_BASE/tabix /usr/bin/
ln -sf $TOOL_DIR/$FILE_BASE/bgzip /usr/bin/

##
wget -q -O ../igv_prep.py           https://github.com/CropEvol/lecture/raw/master/textbook_2022/scripts/igv_prep.py
