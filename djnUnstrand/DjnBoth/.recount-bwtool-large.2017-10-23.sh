#!/bin/bash
#$ -cwd
#$ -l bluejay,mem_free=100G,h_vmem=100G,h_fsize=100G
#$ -N recount-bwtool-large.2017-10-23
#$ -o /dcl01/ajaffe/data/lab/marchionni_projects/djnUnstrand/DjnBoth/logs/recount-bwtool-large.$TASK_ID.txt
#$ -e /dcl01/ajaffe/data/lab/marchionni_projects/djnUnstrand/DjnBoth/logs/recount-bwtool-large.$TASK_ID.txt
#$ -m a
#$ -t 2035-2036
#$ -hold_jid recount-bwtool-run.2017-10-23
echo "**** Job starts ****"
date

echo "**** JHPCE info ****"
echo "User: ${USER}"
echo "Job id: ${JOB_ID}"
echo "Job name: ${JOB_NAME}"
echo "Hostname: ${HOSTNAME}"
echo "Task id: ${SGE_TASK_ID}"

Rscript /users/lcollado/R/x86_64-pc-linux-gnu-library/3.3.x/recount.bwtool/extdata/jhpce/single_rse.R -p "${SGE_TASK_ID}" -r "/dcl01/ajaffe/data/lab/marchionni_projects/djnUnstrand/DjnBoth/DjnBoth.Rdata" -s "sumsDjnBoth" -c "1" -b "sumsDjnBoth/recount.bwtool-2017-10-23.bed" -o "FALSE"

echo "**** Job ends ****"
date
