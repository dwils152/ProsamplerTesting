#!/bin/bash
#SBATCH --partition=Orion
#SBATCH --job-name=prosampler
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




for num_seqs in 10 20 30 50 70 100 200 400 1000 3000 5000 10000
do
	cd fasta_${num_seqs}
	for file in *.centered_${num_seqs}
		do
    			markov -f $4 -i ${file} -b ${file}.shuffled.markov.bg
    			output=${file}.prosampler.txt
    			ProSampler${5} -k $3 -t $1 -w $2 -i ${file} -b ${file}.shuffled.markov.bg -o ${output}
		done
	cd ..
done






cd $SLURM_SUBMIT_DIR
echo "Hello World! I ran on compute node $(/bin/hostname -s)"

echo ""
echo "======================================================"
echo "End Time   : $(date)"
