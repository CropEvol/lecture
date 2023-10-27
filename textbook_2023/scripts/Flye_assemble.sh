Flye='python /content/tools/Flye-2.9.2/bin/flye'
<<<<<<< HEAD
MIN_OVL=1000
OUT_DIR="/content/flye_output"

${Flye} --out-dir $OUT_DIR --min-overlap $MIN_OVL --scaffold --nano-raw $1
=======
THREADS=4
MIN_OVL=1000
OUT_DIR="/content/flye_output"

${Flye} --threads $THREADS --out-dir $OUT_DIR --min-overlap $MIN_OVL --scaffold --nano-raw $1 | grep -v 'Final assembly'
>>>>>>> 9ad22dfc69073c6c5a5b807fce7b3d4c275bd0de
