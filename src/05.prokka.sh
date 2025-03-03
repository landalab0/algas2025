#$ -S /bin/bash
#$ -N prok
#$ -cwd
#$ -o outs/05.prok.out
#$ -e outs/05.prok.err
source /etc/bashrc
export LC_ALL=en_US.UTF-8


conda activate prokka

mkdir -p results/05.prokka
out="results/05.prokka"
input="data/final_genomes/"


for FASTA in $(ls $input/*.fasta); do
        LOCUSTAG=$(basename $FASTA .fasta)
        $echo "Run prokka in: " $LOCUSTAG
        date
        PROKKA='prokka --locustag '$LOCUSTAG'_Scaffold --prefix '$LOCUSTAG' --addgenes --addmrna  --cpus 40 --outdir '$out'/'$LOCUSTAG' '$FASTA''
        echo $PROKKA
        eval $PROKKA
done
