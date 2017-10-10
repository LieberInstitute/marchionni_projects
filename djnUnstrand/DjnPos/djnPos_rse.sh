#!/bin/bash
#$ -cwd
#$ -N DjnPos
#$ -o ./djnPos_rse_log.txt
#$ -e ./djnPos_rse_log.txt
#$ -m e

## Usage:
# qsub djnPos_rse.sh 

bash /users/lcollado/R/x86_64-pc-linux-gnu-library/3.3.x/recount.bwtool/extdata/jhpce/run_rse.sh -r "/dcl01/lieber/ajaffe/lab/marchionni_projects/djnUnstrand/djnPos/djnPos.Rdata" -s "sumsDjnPos" -c 1
