#!/usr/bin/bash
#Run kofam
#DianaOaxaca
#nohup bash src/06.kofam.sh > outs/06.kofam.nohup &

out="results/06.kofam"
db="/home/hoaxaca/kofamscan/db"
kofam="/home/hoaxaca/kofamscan/bin/kofam_scan-1.3.0/exec_annotation"

for fasta in $(ls $out/faa/*.faa | sed 's/.*\///g' | sed 's/.faa//g' | sort -u ); do
        echo "### Run kofam to the sample " $fasta
        date
        ko=''$kofam' '$out'/faa/'$fasta'.faa -o '$out'/'$fasta'.txt --report-unannotated --cpu 25 --tmp-dir '$out'/tmp.'$fasta''
        echo $ko
        eval $ko
done

#rm -r $out/*tmp*
