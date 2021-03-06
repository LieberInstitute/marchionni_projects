#!/bin/bash
#$ -cwd
#$ -l bluejay,mem_free=300G,h_vmem=350G,h_fsize=100G
#$ -N recount-bwtool-merge.2017-10-25
#$ -m a
#$ -o /dcl01/ajaffe/data/lab/marchionni_projects/djnUnstrand/DjnNeg/logs/recount-bwtool-merge.txt
#$ -e /dcl01/ajaffe/data/lab/marchionni_projects/djnUnstrand/DjnNeg/logs/recount-bwtool-merge.txt
#$ -hold_jid recount-bwtool-single.2017-10-25
echo "**** Job starts ****"
date

echo "**** JHPCE info ****"
echo "User: ${USER}"
echo "Job id: ${JOB_ID}"
echo "Job name: ${JOB_NAME}"
echo "Hostname: ${HOSTNAME}"

Rscript /users/lcollado/R/x86_64-pc-linux-gnu-library/3.3.x/recount.bwtool/extdata/jhpce/merge_rse.R

echo "**** Job ends ****"
date
