import sys
from Bio import motifs


def extract(file):

    fout = open(f'{file}.top', 'w')

    with open(file, 'r') as fin:

        hit_float=False

        for line in fin.readlines():

            done_reading = (hit_float and line in ['\n', '\r\n'])

            if done_reading:
                return fout

            if line.startswith(("0.", "1.")):
                hit_float = True

            fout.write(line)


def main():
    
    meme = sys.argv[1]

    extract(meme)

if __name__ == "__main__":
    
    main()
