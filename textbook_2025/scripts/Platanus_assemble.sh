#!/bin/bash
OUT_DIR="/content/platanus_output"
OUT_NAME="illumina"

mkdir -p $OUT_DIR
platanus assemble -o $OUT_DIR/$OUT_NAME -f "${@:1}"