CONTIG=$1
OUT_NAME=$2
READS=("${@:3}")

bwa index $CONTIG
bwa mem $CONTIG `echo ${READS[*]}` > $OUT_NAME.sam
samtools sort -O bam $OUT_NAME.sam > $OUT_NAME.bam
rm -f $OUT_NAME.sam

samtools faidx $CONTIG

python tools/show_alignment.py $CONTIG $OUT_NAME.bam