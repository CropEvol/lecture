%%bash
CONTIG=$1
OUT_NAME=$2

bwa index $CONTIG
bwa mem $CONTIG ${@:3} > $OUT_NAME.sam
samtools sort -O bam $OUT_NAME.sam > $OUT_NAME.bam
rm -f $OUT_NAME.sam

samtools faidx $CONTIG

python tools/show_alignment.py $CONTIG $OUT_NAME.bam