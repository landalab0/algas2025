#$ -S /bin/bash
#$ -N gtdbtk
#$ -cwd
#$ -o outs/04.gtdbtk.out
#$ -e outs/04.gtdbtk.err
source /etc/bashrc
export LC_ALL=en_US.UTF-8


mkdir -p results/04.gtdbtk/

out="results/04.gtdbtk"
input="data/final_genomes"

conda activate gtdbtk2

gtdbtk classify_wf  --genome_dir $input/   --out_dir $out/ -x fasta --cpus 40

#path_to_iqtree -s gtdbtk.bac120.user_msa.fasta -m TEST -b 100 -alrt 1000
