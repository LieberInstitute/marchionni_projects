#!/bin/bash
#$ -cwd
#$ -N F6CAT_rse
#$ -o ./F6CAT_rse.txt
#$ -e ./F6CAT_rse.txt
#$ -m e

## Usage:
# qsub F6CAT_rse.sh 

bash /users/lcollado/R/x86_64-pc-linux-gnu-library/3.3.x/recount.bwtool/extdata/jhpce/run_rse.sh -r "/dcl01/ajaffe/data/lab/marchionni_projects/F6_CAT/F6CAT.Rdata" -s "sumsF6CAT" -c 1
