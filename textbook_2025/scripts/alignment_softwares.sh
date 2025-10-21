#!/bin/bash
## softwares
apt install bwa  >/dev/null
apt install samtools >/dev/null
apt install bcftools >/dev/null

## igv-notebook-0.3.1
pip install -q igv-notebook==0.3.1
wget -q -O igv_prep.py  https://github.com/CropEvol/lecture/raw/master/textbook_2025/scripts/igv_prep.py
