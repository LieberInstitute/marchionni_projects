#!/bin/bash
#$ -cwd
#$ -l mem_free=1G,h_vmem=2G,h_fsize=100G
#$ -N recount-bwtool-commandmerge.2017-10-23
#$ -o /dcl01/ajaffe/data/lab/marchionni_projects/djnUnstrand/DjnBoth/logs/recount-bwtool-commandmerge.$TASK_ID.txt
#$ -e /dcl01/ajaffe/data/lab/marchionni_projects/djnUnstrand/DjnBoth/logs/recount-bwtool-commandmerge.$TASK_ID.txt
#$ -m a
#$ -hold_jid recount-bwtool-commands.2017-10-23
echo "**** Job starts ****"
date

echo "**** JHPCE info ****"
echo "User: ${USER}"
echo "Job id: ${JOB_ID}"
echo "Job name: ${JOB_NAME}"
echo "Hostname: ${HOSTNAME}"
echo "Task id: ${SGE_TASK_ID}"

## Merge command files
cat /dcl01/ajaffe/data/lab/marchionni_projects/djnUnstrand/DjnBoth/recount-bwtool-commands_*.txt > /dcl01/ajaffe/data/lab/marchionni_projects/djnUnstrand/DjnBoth/recount-bwtool-commands.txt

echo "**** Final number of commands ****"
wc -l /dcl01/ajaffe/data/lab/marchionni_projects/djnUnstrand/DjnBoth/recount-bwtool-commands.txt

## Check result is as expected
NLINES=$(wc -l /dcl01/ajaffe/data/lab/marchionni_projects/djnUnstrand/DjnBoth/recount-bwtool-commands.txt | cut -f 1 -d " ")
if [[ "${NLINES}" -ne "70603" ]]
then
    echo "Incorrect number of lines. Was expecting 70603 not ${NLINES}."
    exit 1
fi

## Clean up
rm /dcl01/ajaffe/data/lab/marchionni_projects/djnUnstrand/DjnBoth/recount-bwtool-commands_*.txt 

echo "**** Job ends ****"
date
