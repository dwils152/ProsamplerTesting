import sys
import random
from Bio import SeqIO


def sample(n_seqs, file):

    seqs = list(SeqIO.parse(file, "fasta"))
    sample = random.choices(population=seqs, k=n_seqs)
    #sample = np.random.choice(seqs, size=n_seqs)
    return SeqIO.write(sample, f'{file}_{n_seqs}', "fasta")


def main():

    fin = sys.argv[1]
    sample_sizes = [10, 20, 30, 50, 70, 100, 200, 400, 1000, 3000, 5000, 10000]
    
    for size in sample_sizes:
        sample(size, fin)


if __name__ == "__main__":

    main()
