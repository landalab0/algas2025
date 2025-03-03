#$ -S /bin/bash
#$ -N ani
#$ -cwd
#$ -o outs/02.ani.out
#$ -e outs/02.ani.err
source /etc/bashrc

#average_nucleotide_identity.py -i fna/ -m ANIm -g -o ani
#download genomes with ncbi-genome-download and efetch

#All ANI
#average_nucleotide_identity.py -i data/download/genomes -m ANIm -g -o results/02.ani --gmethod seaborn

#Algiphilus
#average_nucleotide_identity.py -i data/algiphilus/genomes  -m ANIm -g -o results/02.ani/algiphilus

#Arenibacter 
#average_nucleotide_identity.py -i data/arenibacter/genomes/ -m ANIm -g -o results/02.ani/arenibacter

#Halomonas
#average_nucleotide_identity.py -i data/halomonas/genomes  -m ANIm -g -o results/02.ani/halomonas

#Marinobacter
#average_nucleotide_identity.py -i data/marinobacter/genomes  -m ANIm -g -o results/02.ani/marinobacter

#Oceanicola-actibacterium
#average_nucleotide_identity.py -i data/oceanicola_actibacterium/genomes  -m ANIm -g -o results/02.ani/oceanicola_actibacterium

#Porticoccus
#average_nucleotide_identity.py -i data/porticoccus/genomes  -m ANIm -g -o results/02.ani/porticoccus

#Roseovarius
#average_nucleotide_identity.py -i data/roseovarius/genomes  -m ANIm -g -o results/02.ani/roseovarius

# integrated
average_nucleotide_identity.py -i data/final_genomes -m ANIb -g -o results/02.ani/integrated
