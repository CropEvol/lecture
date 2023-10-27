#!/bin/bash
Flye='python /content/tools/Flye-2.9.2/bin/flye'
MIN_OVL=1000
OUT_DIR="/content/flye_output"

READ=$1

${Flye} --out-dir $OUT_DIR --min-overlap $MIN_OVL --scaffold --nano-raw $READ
