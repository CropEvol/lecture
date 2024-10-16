#!/bin/bash
REF=$1
CONTIG=$2
OUT_NAME="asm_to_original"

minimap2 -ax asm5 $REF $CONTIG > $OUT_NAME.sam
samtools sort -O bam $OUT_NAME.sam > $OUT_NAME.bam
rm -f $OUT_NAME.sam
samtools faidx $REF
