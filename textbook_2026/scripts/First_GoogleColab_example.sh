#!/bin/bash
DOWNLOAD_DIR="/content"
mkdir -p $DOWNLOAD_DIR
cd $DOWNLOAD_DIR
## script
wget -q -O run_igv.py  https://github.com/CropEvol/lecture/raw/master/textbook_2025/scripts/run_igv.py
wget -q -O igv_prep.py https://github.com/CropEvol/lecture/raw/master/textbook_2025/scripts/igv_prep.py
## dataset
wget -q -O Human_mt.fasta       https://raw.githubusercontent.com/CropEvol/lecture/refs/heads/master/textbook_2025/dataset/First_GoogleColab_example/Human_mt.fasta
wget -q -O Human_mt.fasta.fai   https://raw.githubusercontent.com/CropEvol/lecture/refs/heads/master/textbook_2025/dataset/First_GoogleColab_example/Human_mt.fasta.fai
wget -q -O long_reads.fastq     https://raw.githubusercontent.com/CropEvol/lecture/refs/heads/master/textbook_2025/dataset/First_GoogleColab_example/long_reads.fastq
wget -q -O long_reads.bam       https://raw.githubusercontent.com/CropEvol/lecture/refs/heads/master/textbook_2025/dataset/First_GoogleColab_example/long_reads.bam
wget -q -O long_reads.bam.bai.  https://raw.githubusercontent.com/CropEvol/lecture/refs/heads/master/textbook_2025/dataset/First_GoogleColab_example/long_reads.bam.bai
wget -q -O short_reads.R1.fastq https://raw.githubusercontent.com/CropEvol/lecture/refs/heads/master/textbook_2025/dataset/First_GoogleColab_example/short_reads.R1.fastq
wget -q -O short_reads.R2.fastq https://raw.githubusercontent.com/CropEvol/lecture/refs/heads/master/textbook_2025/dataset/First_GoogleColab_example/short_reads.R2.fastq
wget -q -O short_reads.bam      https://raw.githubusercontent.com/CropEvol/lecture/refs/heads/master/textbook_2025/dataset/First_GoogleColab_example/short_reads.bam
wget -q -O short_reads.bam.bai  https://raw.githubusercontent.com/CropEvol/lecture/refs/heads/master/textbook_2025/dataset/First_GoogleColab_example/short_reads.bam.bai