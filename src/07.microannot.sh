#$ -S /bin/bash
#$ -N ma
#$ -cwd
#$ -o outs/07.microannot.out
#$ -e outs/07.microannot.err
source /etc/bashrc
export LC_ALL=en_US.UTF-8

conda activate microbeannotator

mkdir -p results/07.MicroAnnot

out="results/07.MicroAnnot"
input="results/05.prokka"

microbeannotator -i $(ls $input/*/*.faa) -d /data/bases/microbeannotator/ -o $out  -t 20 -p 2 -m diamond  --full --refine  --light
