<<<<<<< HEAD
=======
MEM=8
>>>>>>> 9ad22dfc69073c6c5a5b807fce7b3d4c275bd0de
OUT_DIR="/content/platanus_output"
OUT_NAME="illumina"

mkdir -p $OUT_DIR
<<<<<<< HEAD
platanus assemble -o $OUT_DIR/$OUT_NAME -f $@
=======
platanus assemble -m $MEM -o $OUT_DIR/$OUT_NAME -f $@
>>>>>>> 9ad22dfc69073c6c5a5b807fce7b3d4c275bd0de
