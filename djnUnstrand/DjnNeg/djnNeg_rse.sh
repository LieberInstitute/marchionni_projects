#!/bin/bash
#$ -cwd
#$ -N DjnNeg
#$ -o ./djnNeg_rse_log.txt
#$ -e ./djnNeg_rse_log.txt
#$ -m e

## Usage:
# qsub djnNeg_rse.sh 

bash /users/lcollado/R/x86_64-pc-linux-gnu-library/3.3.x/recount.bwtool/extdata/jhpce/run_rse.sh -r "/dcl01/lieber/ajaffe/lab/marchionni_projects/djnUnstrand/DjnNeg/DjnNeg.Rdata" -s "sumsDjnNeg" -c 1
