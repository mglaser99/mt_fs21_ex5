import sys
import tokenize


in_file = sys.argv[1]
out_file = sys.argv[2]

def tokenize(file):
	tokenized = []
	with open(file, "r", encoding="utf8") as f:
		for el in f.readlines():
			line = tokenize.

