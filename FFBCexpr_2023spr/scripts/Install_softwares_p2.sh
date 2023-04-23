base_dir=`pwd`
mkdir -p ${base_dir}/tools

## BLAST+ (local blast tool)
printf "Installing BLAST+ ..."
cd ${base_dir}/tools
wget -q https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.13.0+-x64-linux.tar.gz -O - | tar -zxf -
ln -sf ${base_dir}/tools/ncbi-blast-2.13.0+/bin/* /usr/bin/
printf "completed.\n"

touch QUE.fasta