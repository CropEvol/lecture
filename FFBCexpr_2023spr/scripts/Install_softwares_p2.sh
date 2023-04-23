base_dir=`pwd`
mkdir -p ${base_dir}/tools

## BLAST+ (local blast tool)
printf "Installing BLAST+ ..."
cd ${base_dir}/tools
wget -q https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.13.0+-x64-linux.tar.gz -O - | tar -zxf -
ln -sf ${base_dir}/tools/ncbi-blast-2.13.0+/bin/* /usr/bin/
printf "completed.\n"

cd ${base_dir}/
cat /dev/null > QUERY.fasta

printf "Installing samtools ..."
cd ${base_dir}/tools
wget -q https://www.dropbox.com/s/8ko897pr47kup0k/samtools-1.17.tar.gz?dl=0 -O - | tar -zxf -
ln -sf ${base_dir}/tools/samtools-1.17/samtools /usr/bin/
printf "completed.\n"
