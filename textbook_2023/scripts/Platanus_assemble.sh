OUT_DIR="/content/platanus_output"
OUT_NAME="illumina"

READS=("${@:3}")

mkdir -p $OUT_DIR
platanus assemble -o $OUT_DIR/$OUT_NAME -f `echo ${READS[*]}`