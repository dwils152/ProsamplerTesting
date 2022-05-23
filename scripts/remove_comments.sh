#!/bin/bash
#SBATCH --partition=Orion
#SBATCH --job-name=rm_comment
#SBATCH --ntasks=1
#SBATCH --time=100:00:00

echo "======================================================"
echo "Start Time  : $(date)"
echo "Submit Dir  : $SLURM_SUBMIT_DIR"
echo "Job ID/Name : $SLURM_JOBID / $SLURM_JOB_NAME"
echo "Num Tasks   : $SLURM_NTASKS total [$SLURM_NNODES nodes @ $SLURM_CPUS_ON_NODE CPUs/node]"
echo "======================================================"
echo ""

# Code starts here -----------------------------------------


cd all_tomtom_tsv
for file in *.top_tomtom #
do
	grep -o '^[^#]*' ${file} > ${file}.pval
done




cd $SLURM_SUBMIT_DIR
echo "Hello World! I ran on compute node $(/bin/hostname -s)"

echo ""
echo "======================================================"
echo "End Time   : $(date)"
