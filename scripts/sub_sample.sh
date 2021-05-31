#! /bin/bash

scripts=`dirname "$0"`
base=$scripts/..

data=$base/data/de-nl


src=de
trg=nl

train_size=100000

## get 100 random samples

echo "start sampling"

python $base/scripts/python_scripts/random_samples.py --src-input "$data/train.de-nl.$src" --trg-input "$data/train.de-nl.$trg" \
--src-output "$data/train.de-nl.100k.$src" --trg-output "$data/train.de-nl.100k.$trg" --sample-size $train_size

echo "finished"