#!/bin/bash
#$ -cwd
#$ -l mem_free=1G,h_vmem=2G,h_fsize=100G
#$ -N recount-bwtool-commands.2017-10-24
#$ -o /dcl01/ajaffe/data/lab/marchionni_projects/djnUnstrand/DjnPos/logs/recount-bwtool-commands.$TASK_ID.txt
#$ -e /dcl01/ajaffe/data/lab/marchionni_projects/djnUnstrand/DjnPos/logs/recount-bwtool-commands.$TASK_ID.txt
#$ -m a
#$ -t 1-2036
#$ -tc 199
echo "**** Job starts ****"
date

echo "**** JHPCE info ****"
echo "User: ${USER}"
echo "Job id: ${JOB_ID}"
echo "Job name: ${JOB_NAME}"
echo "Hostname: ${HOSTNAME}"
echo "Task id: ${SGE_TASK_ID}"

Rscript /users/lcollado/R/x86_64-pc-linux-gnu-library/3.3.x/recount.bwtool/extdata/jhpce/single_rse.R -p "${SGE_TASK_ID}" -r "/dcl01/ajaffe/data/lab/marchionni_projects/djnUnstrand/DjnPos/DjnPos.Rdata" -s "sumsDjnPos" -c "1" -b "sumsDjnPos/recount.bwtool-2017-10-24.bed" -o "TRUE"

echo "**** Job ends ****"
date
