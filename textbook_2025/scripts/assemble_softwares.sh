#!/bin/bash
TOOL_DIR="/content/tools"
mkdir -p $TOOL_DIR
cd $TOOL_DIR


### 参考：GoogleDriveのファイルをwgetでダウンロードする方法
### https://qiita.com/cv_carnavi/items/1fc8272da135a36598a2
### https://qiita.com/IsHYuhi/items/e4afc0163019343d9664

## Platanus-1.2.4 from GoogleDrive
FILE_ID="1UOH7yZvCbbEWLgJWBOm9U2rCaxXwJ50J";
FILE_NAME="Platanus-1.2.4.tar.gz";
FILE_BASE=`basename -s ".tar.gz" $FILE_NAME`
gdown https://drive.google.com/uc?id=$FILE_ID --no-cookies -O $FILE_NAME
tar -zxf $FILE_NAME
rm -f $FILE_NAME
ln -sf $TOOL_DIR/$FILE_BASE/platanus /usr/bin/

## Flye-2.9.4 from GoogleDrive
FILE_ID="16HqkMss3rNd-l9XW7Yz-qg6xITSZZQ94";
FILE_NAME="Flye-2.9.4.tar.gz";
FILE_BASE=`basename -s ".tar.gz" $FILE_NAME`
gdown https://drive.google.com/uc?id=$FILE_ID --no-cookies -O $FILE_NAME
tar -zxf $FILE_NAME
rm -f $FILE_NAME
ln -sf $TOOL_DIR/$FILE_BASE/flye /usr/bin/

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

## bcftools-1.21 from GoogleDrive
FILE_ID="1--rhCPb655FeAUokOGRcvwj7O0doTs84";
FILE_NAME="bcftools-1.21.tar.gz";
FILE_BASE=`basename -s ".tar.gz" $FILE_NAME`
gdown https://drive.google.com/uc?id=$FILE_ID --no-cookies -O $FILE_NAME
tar -zxf $FILE_NAME
rm -f $FILE_NAME
ln -sf $TOOL_DIR/$FILE_BASE/bcftools /usr/bin/

## htslib-1.21 from GoogleDrive
FILE_ID="1-3HEsOQrygyigtQ1M9KKuztYn48CP7W4";
FILE_NAME="htslib-1.21.tar.gz";
FILE_BASE=`basename -s ".tar.gz" $FILE_NAME`
gdown https://drive.google.com/uc?id=$FILE_ID --no-cookies -O $FILE_NAME
tar -zxf $FILE_NAME
rm -f $FILE_NAME
ln -sf $TOOL_DIR/$FILE_BASE/tabix /usr/bin/
ln -sf $TOOL_DIR/$FILE_BASE/bgzip /usr/bin/

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

## igv-notebook-0.3.1 from Github
pip install -q igv-notebook==0.3.1

## pilon-1.24.jar
wget -q -O pilon-1.24.jar https://github.com/broadinstitute/pilon/releases/download/v1.24/pilon-1.24.jar

## pipelines

wget -q -O ../Flye_assemble.sh      https://github.com/CropEvol/lecture/raw/master/textbook_2025/scripts/Flye_assemble.sh
wget -q -O ../Platanus_assemble.sh  https://github.com/CropEvol/lecture/raw/master/textbook_2025/scripts/Platanus_assemble.sh
wget -q -O ../Polishing.sh          https://github.com/CropEvol/lecture/raw/master/textbook_2025/scripts/Polishing.sh
wget -q -O ../Alignment_bwa.sh      https://github.com/CropEvol/lecture/raw/master/textbook_2025/scripts/Alignment_bwa.sh
wget -q -O ../Alignment_mm2.sh      https://github.com/CropEvol/lecture/raw/master/textbook_2025/scripts/Alignment_mm2.sh
wget -q -O ../run_igv.py            https://github.com/CropEvol/lecture/raw/master/textbook_2025/scripts/run_igv.py
wget -q -O ../igv_prep.py           https://github.com/CropEvol/lecture/raw/master/textbook_2025/scripts/igv_prep.py
