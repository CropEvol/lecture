base_dir=/content
mkdir -p ${base_dir}/tools

## NanoFilt/NanoLyse/NanoPlot
printf "Installing NanoFilt, NanoPlot, NanoStat ...\n"
# printf "Installing NanoFilt, NanoLyse, NanoPlot, NanoStat ...\n"
pip install -q nanofilt
pip install -q NanoStat
# pip install -q NanoLyse
pip install -q NanoPlot
printf "completed.\n"

## IGV
printf "Installing IGV ...\n"
pip install -q igv-notebook==0.3.1
wget -q https://github.com/CropEvol/lecture/raw/master/textbook_2022/scripts/igv_prep.py -O igv_prep.py
printf "completed.\n"

# ## bwa
# printf "Installing bwa ..."
# cd ${base_dir}/tools
# wget -q https://github.com/lh3/bwa/releases/download/v0.7.17/bwa-0.7.17.tar.bz2 -O - | tar -jxf -
# cd bwa-0.7.17
# make 1>/dev/null 2>/dev/null
# ln -sf ${base_dir}/tools/bwa-0.7.17/bwa /usr/bin/
# printf "completed.\n"

printf "Installing bwa ..."
cd ${base_dir}/tools
wget -q https://www.dropbox.com/s/gueedmnp79932bz/bwa-0.7.17.tar.gz?dl=0 -O - | tar -zxf -
ln -sf ${base_dir}/tools/bwa-0.7.17/bwa /usr/bin/
printf "completed.\n"

# ## samtools
# printf "Installing samtools ..."
# cd ${base_dir}/tools
# wget -q https://github.com/samtools/samtools/releases/download/1.17/samtools-1.17.tar.bz2 -O - | tar -jxf -
# cd samtools-1.17
# ./configure 1>/dev/null 2>/dev/null
# make 1>/dev/null 2>/dev/null
# ln -sf ${base_dir}/tools/samtools-1.17/samtools /usr/bin/
# printf "completed.\n"

printf "Installing samtools ..."
cd ${base_dir}/tools
wget -q https://www.dropbox.com/s/8ko897pr47kup0k/samtools-1.17.tar.gz?dl=0 -O - | tar -zxf -
ln -sf ${base_dir}/tools/samtools-1.17/samtools /usr/bin/
printf "completed.\n"

# ## bcftools
# printf "Installing bcftools ..."
# cd ${base_dir}/tools
# wget -q https://github.com/samtools/bcftools/releases/download/1.17/bcftools-1.17.tar.bz2 -O - | tar -jxf -
# cd bcftools-1.17
# ./configure 1>/dev/null 2>/dev/null
# make 1>/dev/null 2>/dev/null
# ln -sf ${base_dir}/tools/bcftools-1.17/bcftools /usr/bin/
# printf "completed.\n"

printf "Installing bcftools ..."
cd ${base_dir}/tools
wget -q https://www.dropbox.com/s/zl5tskqzwrc417t/bcftools-1.17.tar.gz?dl=0 -O - | tar -zxf -
ln -sf ${base_dir}/tools/bcftools-1.17/bcftools /usr/bin/
printf "completed.\n"

# ## htslib
# printf "Installing htslib ..."
# cd ${base_dir}/tools
# wget -q https://github.com/samtools/htslib/releases/download/1.17/htslib-1.17.tar.bz2 -O - | tar -jxf -
# cd htslib-1.17
# ./configure 1>/dev/null 2>/dev/null
# make 1>/dev/null 2>/dev/null
# ln -sf ${base_dir}/tools/htslib-1.17/tabix /usr/bin/
# ln -sf ${base_dir}/tools/htslib-1.17/bgzip /usr/bin/
# printf "completed.\n"

printf "Installing tabix, bgzip ..."
ln -sf ${base_dir}/tools/bcftools-1.17/htslib-1.17/tabix /usr/bin/
ln -sf ${base_dir}/tools/bcftools-1.17/htslib-1.17/bgzip /usr/bin/
printf "completed.\n"
