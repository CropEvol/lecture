current_dir=`pwd`
mkdir -p ${current_dir}/tools

## NanoFilt/NanoLyse/NanoPlot
printf "Installing NanoFilt, NanoLyse, NanoPlot, NanoStat ..."
pip install -q nanofilt
pip install -q NanoLyse
pip install -q NanoPlot
pip install -q NanoStat
printf "completed.\n"

## bwa
printf "Installing bwa ..."
cd ${current_dir}/tools
wget -q https://github.com/lh3/bwa/releases/download/v0.7.17/bwa-0.7.17.tar.bz2 -O - | tar -jxf -
cd bwa-0.7.17
make 1>/dev/null 2>/dev/null
ln -sf ${current_dir}/tools/bwa-0.7.17/bwa /usr/bin/
printf "completed.\n"

## samtools
printf "Installing samtools ..."
cd ${current_dir}/tools
wget -q https://github.com/samtools/samtools/releases/download/1.17/samtools-1.17.tar.bz2 -O - | tar -jxf -
cd samtools-1.17
./configure 1>/dev/null 2>/dev/null
make 1>/dev/null 2>/dev/null
ln -sf ${current_dir}/tools/samtools-1.17/samtools /usr/bin/
printf "completed.\n"

## bcftools
printf "Installing bcftools ..."
cd ${current_dir}/tools
wget -q https://github.com/samtools/bcftools/releases/download/1.17/bcftools-1.17.tar.bz2 -O - | tar -jxf -
cd bcftools-1.17
./configure 1>/dev/null 2>/dev/null
make 1>/dev/null 2>/dev/null
ln -sf ${current_dir}/tools/bcftools-1.17/bcftools /usr/bin/
printf "completed.\n"

## htslib
printf "Installing htslib ..."
cd ${current_dir}/tools
wget -q https://github.com/samtools/htslib/releases/download/1.17/htslib-1.17.tar.bz2 -O - | tar -jxf -
cd htslib-1.17
./configure 1>/dev/null 2>/dev/null
make 1>/dev/null 2>/dev/null
ln -sf ${current_dir}/tools/htslib-1.17/tabix /usr/bin/
ln -sf ${current_dir}/tools/htslib-1.17/bgzip /usr/bin/
printf "completed.\n"
