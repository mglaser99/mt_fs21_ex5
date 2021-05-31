#! /bin/bash

scripts=`dirname "$0"`
base=$scripts/..

data=$base/data/de-nl
models=$base/models

mkdir -p $models
mkdir -p $data/vocab

src=de
trg=nl

vocab_size1=2000
vocab_size2=5000

#train bpe models

subword-nmt learn-joint-bpe-and-vocab -i $data/train.de-nl.100k.tokenized.$src $data/train.de-nl.100k.tokenized.$trg \
--write-vocabulary $data/vocab/vocab_2k.de $data/vocab/vocab_2k.nl -s $vocab_size1 --total-symbols -o $models/bpe_2k_model

subword-nmt learn-joint-bpe-and-vocab -i $data/train.de-nl.100k.tokenized.$src $data/train.de-nl.100k.tokenized.$trg \
--write-vocabulary $data/vocab/vocab_5k.de $data/vocab/vocab_5k.nl -s $vocab_size2 --total-symbols -o $models/bpe_5k_model