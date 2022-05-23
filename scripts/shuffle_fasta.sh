#!/bin/bash
#SBATCH --partition=Orion
#SBATCH --job-name=shuffle_kmers
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

module load meme

for d in *
do
	if [[ -d $d ]]; then cd $d

	for file in *.centered_*
		do
			fasta-shuffle-letters -kmer 3 -dna -seed 42 ${file} > ${file}.shuffled
		done
	cd ..
	fi
done

cd $SLURM_SUBMIT_DIR
echo "Hello World! I ran on compute node $(/bin/hostname -s)"

echo ""
echo "======================================================"
echo "End Time   : $(date)"
