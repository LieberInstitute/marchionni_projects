#!/bin/bash
#$ -cwd
#$ -l mem_free=1G,h_vmem=2G,h_fsize=100G
#$ -N recount-bwtool-run.2017-10-24
#$ -o /dcl01/ajaffe/data/lab/marchionni_projects/djnUnstrand/DjnPos/logs/recount-bwtool-run.$TASK_ID.txt
#$ -e /dcl01/ajaffe/data/lab/marchionni_projects/djnUnstrand/DjnPos/logs/recount-bwtool-run.$TASK_ID.txt
#$ -m a
#$ -t 1-70603
#$ -tc 199
#$ -hold_jid recount-bwtool-commandmerge.2017-10-24
echo "**** Job starts ****"
date

echo "**** JHPCE info ****"
echo "User: ${USER}"
echo "Job id: ${JOB_ID}"
echo "Job name: ${JOB_NAME}"
echo "Hostname: ${HOSTNAME}"
echo "Task id: ${SGE_TASK_ID}"

bwtoolcmd=$(awk "NR==${SGE_TASK_ID}" /dcl01/ajaffe/data/lab/marchionni_projects/djnUnstrand/DjnPos/recount-bwtool-commands.txt)

## Run bwtool
mkdir -p sumsDjnPos
echo "${bwtoolcmd}"
${bwtoolcmd}

echo "**** Job ends ****"
date
