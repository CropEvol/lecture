#!/bin/bash
DOWNLOAD_DIR="/content"
mkdir -p $DOWNLOAD_DIR
cd $DOWNLOAD_DIR

FILE_NAME="illumina_read1.fastq.gz"
FILE_NAME2=`basename -s ".gz" $FILE_NAME`
wget -q -O $FILE_NAME https://github.com/CropEvol/lecture/raw/master/textbook_2024/dataset/$FILE_NAME
gzip -dc $FILE_NAME > $FILE_NAME2
rm -f $FILE_NAME

FILE_NAME="illumina_read2.fastq.gz"
FILE_NAME2=`basename -s ".gz" $FILE_NAME`
wget -q -O $FILE_NAME https://github.com/CropEvol/lecture/raw/master/textbook_2024/dataset/$FILE_NAME
gzip -dc $FILE_NAME > $FILE_NAME2
rm -f $FILE_NAME

FILE_NAME="nanopore.fastq.gz"
FILE_NAME2=`basename -s ".gz" $FILE_NAME`
wget -q -O $FILE_NAME https://github.com/CropEvol/lecture/raw/master/textbook_2024/dataset/$FILE_NAME
gzip -dc $FILE_NAME > $FILE_NAME2
rm -f $FILE_NAME

FILE_NAME="sample_genome.fa"
wget -q -O $FILE_NAME https://github.com/CropEvol/lecture/raw/master/textbook_2024/dataset/$FILE_NAME