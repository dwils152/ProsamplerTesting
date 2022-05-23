
import sys
import pandas as pd
import os

def load_validated():
    return pd.read_table('files_tf.txt', names=['file', 'tf'], sep="\t")


def load_hits(file):
    return pd.read_table(file, header=0, sep="\t")


def write_hits(fin, fout, pq, thresh):

    pd.options.display.float_format = "{:,.8f}".format

    validated = load_validated()#filename, TF
    hits = load_hits(fin)#TF, p-value
    significant = hits[hits[str(pq)] <= float(thresh)] #subset the dataframe to tomtom pvals < 10-5
    file_dict = validated.set_index('file').to_dict()['tf']#filename, TF
    filename = fin.split('.gz')[0]

    match = any(
        file_dict[filename] == tf for tf in significant['Target_ID'].tolist()
    )

    if match:
        fout.write(f'{fin}\n')



def main():
    fin = sys.argv[1]
    thresh = sys.argv[2]
    pq = sys.argv[3]
    if os.stat(fin).st_size == 0:
        sys.exit()
    fout = open('tomtom_hits.txt', 'a')
    write_hits(fin, fout, pq, thresh)
    
if __name__ == "__main__":
    
    main()
