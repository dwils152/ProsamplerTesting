#!/bin/bash
#SBATCH --partition=Orion
#SBATCH --job-name=get_top
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

module load anaconda3

for dir in fasta_*
do
	cd ${dir}
	if compgen -G *.meme; then 
		for file in *.meme
		do
			python ../extract_highscore.py ${file} #
		done
	fi
	cd ..
done






cd $SLURM_SUBMIT_DIR
echo "Hello World! I ran on compute node $(/bin/hostname -s)"

echo ""
echo "======================================================"
echo "End Time   : $(date)"
