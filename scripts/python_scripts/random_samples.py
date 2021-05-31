import argparse
import random


def parse_arguments():
    parser = argparse.ArgumentParser()
    parser.add_argument("--src-input", type=str,
                        help="input file for src language")
    parser.add_argument("--trg-input", type=str,
                        help="input file for trg language")
    parser.add_argument("--src-output", type=str,
                        help="output file for src language")
    parser.add_argument("--trg-output", type=str,
                        help="ouput file for trg language")
    parser.add_argument("--sample-size", type=int,
                        help="number of random sentence pairs")
    args = parser.parse_args()

    return args


def random_samples():
    args = parse_arguments()
    src_input = open(args.src_input, encoding="utf8").readlines()
    trg_input = open(args.trg_input, encoding="utf8").readlines()
    sample_size = args.sample_size

    rand_lines = random.sample(range(len(src_input)), sample_size)

    src_output = []
    trg_output = []
    for n in rand_lines:
        src_output.append(src_input[n])
        trg_output.append(trg_input[n])

    with open(args.src_output, "w", encoding="utf8") as srcf, \
            open(args.trg_output, "w", encoding="utf8") as trgf:
        for s, o in zip(src_output, trg_output):
            srcf.write(s)
            trgf.write(o)


if __name__ == "__main__":
    random_samples()
