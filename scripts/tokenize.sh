#! /bin/bash

scripts=`dirname "$0"`
base=$scripts/..

data=$base/data/de-nl

src=de
trg=nl

MOSES=$base/tools/moses-scripts/scripts

# tokenize the train files

cat $data/train.de-nl.100k.$src | $MOSES/tokenizer/tokenizer.perl > $data/train.de-nl.100k.tokenized.$src 

cat $data/train.de-nl.100k.$trg | $MOSES/tokenizer/tokenizer.perl > $data/train.de-nl.100k.tokenized.$trg

# tokenize test files

cat $data/test.de-nl.$src | $MOSES/tokenizer/tokenizer.perl > $data/test.de-nl.tokenized.$src 

cat $data/test.de-nl.$trg | $MOSES/tokenizer/tokenizer.perl > $data/test.de-nl.tokenized.$trg

# tokenize dev files

cat $data/dev.de-nl.$src | $MOSES/tokenizer/tokenizer.perl > $data/dev.de-nl.tokenized.$src 

cat $data/dev.de-nl.$trg | $MOSES/tokenizer/tokenizer.perl > $data/dev.de-nl.tokenized.$trg