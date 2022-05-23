#!/bin/bash
#SBATCH --partition=Orion
#SBATCH --job-name=sample_fasta
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

dir_name=$1

mkdir -p  ${dir_name}
cd ${dir_name}
mkdir -p ./fasta_10
mkdir -p ./fasta_20
mkdir -p ./fasta_30
mkdir -p ./fasta_50
mkdir -p ./fasta_70
mkdir -p ./fasta_100
mkdir -p ./fasta_200
mkdir -p ./fasta_400
mkdir -p ./fasta_1000
mkdir -p ./fasta_3000
mkdir -p ./fasta_5000
mkdir -p ./fasta_10000

cp ../centered/*.centered .

for file in *.centered; do
	python3 ../sample_fasta.py ${file}
done


mv *.centered_10 ./fasta_10
mv *.centered_20 ./fasta_20
mv *.centered_30 ./fasta_30
mv *.centered_50 ./fasta_50
mv *.centered_70 ./fasta_70
mv *.centered_100 ./fasta_100
mv *.centered_200 ./fasta_200
mv *.centered_400 ./fasta_400
mv *.centered_1000 ./fasta_1000
mv *.centered_3000 ./fasta_3000
mv *.centered_5000 ./fasta_5000
mv *.centered_10000 ./fasta_10000





cd $SLURM_SUBMIT_DIR
echo "Hello World! I ran on compute node $(/bin/hostname -s)"

echo ""
echo "======================================================"
echo "End Time   : $(date)"
