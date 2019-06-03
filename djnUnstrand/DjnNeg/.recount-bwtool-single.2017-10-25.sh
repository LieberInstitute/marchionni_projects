#!/bin/bash
#$ -cwd
#$ -l bluejay,mem_free=50G,h_vmem=50G,h_fsize=100G
#$ -N recount-bwtool-single.2017-10-25
#$ -o /dcl01/ajaffe/data/lab/marchionni_projects/djnUnstrand/DjnNeg/logs/recount-bwtool-single.$TASK_ID.txt
#$ -e /dcl01/ajaffe/data/lab/marchionni_projects/djnUnstrand/DjnNeg/logs/recount-bwtool-single.$TASK_ID.txt
#$ -m a
#$ -t 735
#$ -tc 100
#$ -hold_jid recount-bwtool-run.2017-10-25
echo "**** Job starts ****"
date

echo "**** JHPCE info ****"
echo "User: ${USER}"
echo "Job id: ${JOB_ID}"
echo "Job name: ${JOB_NAME}"
echo "Hostname: ${HOSTNAME}"
echo "Task id: ${SGE_TASK_ID}"

Rscript /users/lcollado/R/x86_64-pc-linux-gnu-library/3.3.x/recount.bwtool/extdata/jhpce/single_rse.R -p "${SGE_TASK_ID}" -r "/dcl01/ajaffe/data/lab/marchionni_projects/djnUnstrand/DjnNeg/DjnNeg.Rdata" -s "sumsDjnNeg" -c "1" -b "sumsDjnNeg/recount.bwtool-2017-10-25.bed" -o "FALSE"

echo "**** Job ends ****"
date
