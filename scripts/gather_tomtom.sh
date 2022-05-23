#!/bin/bash
#SBATCH --partition=Orion
#SBATCH --job-name=gather
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
mkdir all_tomtom_tsv
for sample in 10 20 30 50 70 100 200 400 1000 3000 5000 10000
do
	cd fasta_${sample}
	if compgen -G *_tomtom; then
		for inner_dir in *_tomtom
		do
			cd ${inner_dir}
			cp wg* ../../all_tomtom_tsv
			cd ..
		done
	fi
	cd ..
done
		





cd $SLURM_SUBMIT_DIR
echo "Hello World! I ran on compute node $(/bin/hostname -s)"

echo ""
echo "======================================================"
echo "End Time   : $(date)"
