#! /bin/bash
## Install softwares

## Make tool-directory
rm -fR sample_data
mkdir -p tools

## Install bwa
cd /content/tools
wget -q https://github.com/lh3/bwa/releases/download/v0.7.17/bwa-0.7.17.tar.bz2 -O - | tar -jxf -
cd bwa-0.7.17
make 1>/dev/null 2>/dev/null
ln -sf /content/tools/bwa-0.7.17/bwa /usr/bin/
which bwa

## Install samtools
cd /content/tools
wget -q https://github.com/samtools/samtools/releases/download/1.15.1/samtools-1.15.1.tar.bz2 -O - | tar -jxf -
cd samtools-1.15.1
./configure 1>/dev/null 2>/dev/null
make 1>/dev/null 2>/dev/null
ln -sf /content/tools/samtools-1.15.1/samtools /usr/bin/
which samtools
