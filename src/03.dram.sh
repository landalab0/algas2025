#$ -S /bin/bash
#$ -N alg
#$ -cwd
#$ -o outs/03.dram.out
#$ -e outs/03.dram.err
source /etc/bashrc
export LC_ALL=en_US.UTF-8

conda activate DRAM1


#DRAM.py annotate -i 'data/final_genomes/*.fasta' -o results/03.dram --min_contig_size 500 --prodigal_mode single --threads 32 --verbose
DRAM.py distill -i results/03.dram/annotations.tsv -o results/03.dram/distill --trna_path results/03.dram/trnas.tsv --rrna_path results/03.dram/rrnas.tsv


