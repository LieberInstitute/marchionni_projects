#!/bin/bash
#$ -cwd
#$ -N DjnBoth
#$ -o ./djnBoth_rse_log.txt
#$ -e ./djnBoth_rse_log.txt
#$ -m e

## Usage:
# qsub djnBoth_rse.sh 

bash /users/lcollado/R/x86_64-pc-linux-gnu-library/3.3.x/recount.bwtool/extdata/jhpce/run_rse.sh -r "/dcl01/ajaffe/data/lab/marchionni_projects/djnUnstrand/DjnBoth/DjnBoth.Rdata" -s "sumsDjnBoth" -c 1
