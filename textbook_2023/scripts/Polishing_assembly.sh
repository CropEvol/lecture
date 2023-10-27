%%bash
Pilon_jar="/content/tools/pilon-1.24.jar"

CONTIG=$1
OUTPUT=$2
READS=("${@:3}")

bwa index $CONTIG
bwa mem $CONTIG `echo ${READS[*]}` > ${OUTPUT}_polishing.sam
samtools sort -O bam ${OUTPUT}_polishing.sam > ${OUTPUT}_polishing.bam
rm -f ${OUTPUT}_polishing.sam

samtools index ${OUTPUT}_polishing.bam
java -Xmx4G -jar $Pilon_jar --genome $CONTIG --frags ${OUTPUT}_polishing.bam --output ${OUTPUT}_polished