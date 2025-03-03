#$ -S /bin/bash
#$ -N gtdbtk
#$ -cwd
#$ -o outs/01.gtdbtk.out
#$ -e outs/01.gtdbtk.err
source /etc/bashrc
export LC_ALL=en_US.UTF-8


mkdir -p results/01.gtdbtk/

out="results/01.gtdbtk"
input="data"

conda activate gtdbtk2

gtdbtk classify_wf  --genome_dir $input/   --out_dir $out/ -x fasta --cpus 40

#path_to_iqtree -s gtdbtk.bac120.user_msa.fasta -m TEST -b 100 -alrt 1000
