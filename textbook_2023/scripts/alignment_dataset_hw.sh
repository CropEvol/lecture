#!/bin/bash
DOWNLOAD_DIR="/content"
mkdir -p $DOWNLOAD_DIR
cd $DOWNLOAD_DIR

wget -q https://github.com/CropEvol/lecture/raw/master/textbook_2022/datasets/genome.tar.gz -O - | tar -zxf - 2>/dev/null
wget -q https://github.com/CropEvol/lecture/raw/master/textbook_2022/datasets/bam.tar.gz -O - | tar -zxf - 2>/dev/null
