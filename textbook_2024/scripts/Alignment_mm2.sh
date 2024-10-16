#!/bin/bash
REF=$1
CONTIG=$3
OUT_NAME=$2

minimap2 -ax asm5 $REF $CONTIG > $OUT_NAME.sam
samtools sort -O bam $OUT_NAME.sam > $OUT_NAME.bam
rm -f $OUT_NAME.sam
samtools faidx $REF
