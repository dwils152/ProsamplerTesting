import sys


def extract(file):

    fout = open(f'{file}.top3', 'w')

    with open(file) as fin:

        hit_float=False
        motif_count = 0
        float_count = 0

        for line in fin.readlines():

            if line.startswith('MOTIF'):
                motif_count += 1

            if motif_count < 4:
                fout.write(line)
                continue


def main():
    
    meme = sys.argv[1]

    extract(meme)

if __name__ == "__main__":
    
    main()
