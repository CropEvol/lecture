#!/bin/bash
CONTIG=$1
OUTPUT=$2

bwa index $CONTIG
bwa mem $CONTIG "${@:3}" > ${OUTPUT}_polishing.sam
samtools sort -O bam ${OUTPUT}_polishing.sam > ${OUTPUT}_polishing.bam
rm -f ${OUTPUT}_polishing.sam

samtools index ${OUTPUT}_polishing.bam
pilon --genome $CONTIG --frags ${OUTPUT}_polishing.bam --output ${OUTPUT}_polished