#!/bin/bash
#$ -cwd
#$ -N F6CAT_rse
#$ -o ./djnUnstrand_rse_log.txt
#$ -e ./djnUnstrand_rse_log.txt
#$ -m e

## Usage:
# qsub djnUnstrand_rse.sh 

bash /users/lcollado/R/x86_64-pc-linux-gnu-library/3.3.x/recount.bwtool/extdata/jhpce/run_rse.sh -r "/dcl01/lieber/ajaffe/lab/marchionni_projects/djnUnstrand/disjoinedByunstrand.rda" -s "sumsDjnUnstrand" -c 1
