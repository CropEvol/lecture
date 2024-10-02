#!/bin/bash
TOOL_DIR="/content/tools"
mkdir -p $TOOL_DIR
cd $TOOL_DIR

### 参考：GoogleDriveのファイルをwgetでダウンロードする方法
### https://qiita.com/cv_carnavi/items/1fc8272da135a36598a2

# Platanus-1.2.4 from GoogleDrive
FILE_ID="1UOH7yZvCbbEWLgJWBOm9U2rCaxXwJ50J";
FILE_NAME="Platanus-1.2.4.tar.gz";
FILE_BASE=`basename -s ".tar.gz" $FILE_NAME`
CONFIRM=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate "https://drive.google.com/uc?export=download&id=$FILE_ID" -O- | sed -En 's/.*confirm=([0-9A-Za-z_]+).*/\1/p');
wget -q --load-cookies /tmp/cookies.txt "https://drive.google.com/uc?export=download&confirm=$CONFIRM&id=$FILE_ID" -O $FILE_NAME;
rm -f /tmp/cookies.txt
tar -zxf $FILE_NAME
rm -f $FILE_NAME
ln -sf $TOOL_DIR/$FILE_BASE/platanus /usr/bin/

## Flye-2.9.2 from GoogleDrive
FILE_ID="183cxJNMY8BiG2LGpvbOnv8fAcU6Piv0r";
FILE_NAME="Flye-2.9.2.tar.gz";
FILE_BASE=`basename -s ".tar.gz" $FILE_NAME`
CONFIRM=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate "https://drive.google.com/uc?export=download&id=$FILE_ID" -O- | sed -En 's/.*confirm=([0-9A-Za-z_]+).*/\1/p');
wget -q --load-cookies /tmp/cookies.txt "https://drive.google.com/uc?export=download&confirm=$CONFIRM&id=$FILE_ID" -O $FILE_NAME;
rm -f /tmp/cookies.txt
tar -zxf $FILE_NAME
rm -f $FILE_NAME
ln -sf $TOOL_DIR/$FILE_BASE/flye /usr/bin/

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
FILE_NAME="samtools-1.21.tar.gz";
FILE_BASE=`basename -s ".tar.gz" $FILE_NAME`
CONFIRM=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate "https://drive.google.com/uc?export=download&id=$FILE_ID" -O- | sed -En 's/.*confirm=([0-9A-Za-z_]+).*/\1/p');
wget -q --load-cookies /tmp/cookies.txt "https://drive.google.com/uc?export=download&confirm=$CONFIRM&id=$FILE_ID" -O $FILE_NAME;
rm -f /tmp/cookies.txt
tar -zxf $FILE_NAME
rm -f $FILE_NAME
ln -sf $TOOL_DIR/$FILE_BASE/samtools /usr/bin/

## bcftools-1.17 from GoogleDrive
FILE_ID="1kIF5LGITMsqNYVSs2Hkfekotc7P90KV_";
FILE_NAME="bcftools-1.21.tar.gz";
FILE_BASE=`basename -s ".tar.gz" $FILE_NAME`
CONFIRM=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate "https://drive.google.com/uc?export=download&id=$FILE_ID" -O- | sed -En 's/.*confirm=([0-9A-Za-z_]+).*/\1/p');
wget -q --load-cookies /tmp/cookies.txt "https://drive.google.com/uc?export=download&confirm=$CONFIRM&id=$FILE_ID" -O $FILE_NAME;
rm -f /tmp/cookies.txt
tar -zxf $FILE_NAME
rm -f $FILE_NAME
ln -sf $TOOL_DIR/$FILE_BASE/bcftools /usr/bin/

## htslib-1.17 from GoogleDrive
FILE_ID="1CCEDZzrpVR5WYpWkvbVyQZ4UHlerLXNO";
FILE_NAME="htslib-1.21.tar.gz";
FILE_BASE=`basename -s ".tar.gz" $FILE_NAME`
CONFIRM=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate "https://drive.google.com/uc?export=download&id=$FILE_ID" -O- | sed -En 's/.*confirm=([0-9A-Za-z_]+).*/\1/p');
wget -q --load-cookies /tmp/cookies.txt "https://drive.google.com/uc?export=download&confirm=$CONFIRM&id=$FILE_ID" -O $FILE_NAME;
rm -f /tmp/cookies.txt
tar -zxf $FILE_NAME
rm -f $FILE_NAME
ln -sf $TOOL_DIR/$FILE_BASE/tabix /usr/bin/
ln -sf $TOOL_DIR/$FILE_BASE/bgzip /usr/bin/

## SeqKit v2.5.1 from GoogleDrive
FILE_ID="1JTiW78S0K4H_ag42wy5ojPLWKSR7V3_E";
FILE_NAME="seqkit_linux_amd64.tar.gz";
CONFIRM=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate "https://drive.google.com/uc?export=download&id=$FILE_ID" -O- | sed -En 's/.*confirm=([0-9A-Za-z_]+).*/\1/p');
wget -q --load-cookies /tmp/cookies.txt "https://drive.google.com/uc?export=download&confirm=$CONFIRM&id=$FILE_ID" -O $FILE_NAME;
rm -f /tmp/cookies.txt
tar -zxf $FILE_NAME
rm -f $FILE_NAME
ln -sf $TOOL_DIR/seqkit /usr/bin/

# ## MUMmer3.23 from GoogleDrive
# FILE_ID="1JGTuRdf8-zdKnZ4XR_WxsOrvGmE4B14L";
# FILE_NAME="MUMmer3.23.tar.gz";
# CONFIRM=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate "https://drive.google.com/uc?export=download&id=$FILE_ID" -O- | sed -En 's/.*confirm=([0-9A-Za-z_]+).*/\1/p');
# wget -q --load-cookies /tmp/cookies.txt "https://drive.google.com/uc?export=download&confirm=$CONFIRM&id=$FILE_ID" -O $FILE_NAME;
# rm -f /tmp/cookies.txt
# tar -zxf $FILE_NAME
# rm -f $FILE_NAME
# ln -sf $TOOL_DIR/nucmer /usr/bin/

## igv-notebook-0.3.1 from Github
pip install -q igv-notebook==0.3.1

## pilon-1.24.jar
wget -q -O pilon-1.24.jar https://github.com/broadinstitute/pilon/releases/download/v1.24/pilon-1.24.jar

## pipelines

wget -q -O ../Flye_assemble.sh      https://github.com/CropEvol/lecture/raw/master/textbook_2024/scripts/Flye_assemble.sh
wget -q -O ../Platanus_assemble.sh  https://github.com/CropEvol/lecture/raw/master/textbook_2024/scripts/Platanus_assemble.sh
wget -q -O ../Polishing.sh          https://github.com/CropEvol/lecture/raw/master/textbook_2024/scripts/Polishing.sh
wget -q -O ../Alignment.sh          https://github.com/CropEvol/lecture/raw/master/textbook_2024/scripts/Alignment.sh
wget -q -O ../run_igv.py            https://github.com/CropEvol/lecture/raw/master/textbook_2024/scripts/run_igv.py
wget -q -O ../igv_prep.py           https://github.com/CropEvol/lecture/raw/master/textbook_2024/scripts/igv_prep.py
