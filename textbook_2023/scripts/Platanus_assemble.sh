MEM=8
OUT_DIR="/content/platanus_output"
OUT_NAME="illumina"

mkdir -p $OUT_DIR
platanus assemble -m $MEM -o $OUT_DIR/$OUT_NAME -f $@