#! /bin/bash
## Install softwares

## Make tool-directory
rm -fR sample_data
mkdir -p tools

## Install samtools
cd /content/tools
wget -q https://github.com/samtools/samtools/releases/download/1.15.1/samtools-1.15.1.tar.bz2 -O - | tar -jxf -
cd samtools-1.15.1
./configure 1>/dev/null 2>/dev/null
make 1>/dev/null 2>/dev/null
ln -sf /content/tools/samtools-1.15.1/samtools /usr/bin/
which samtools
