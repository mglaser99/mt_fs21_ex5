#! /bin/bash

scripts=`dirname "$0"`
base=$scripts/..

data=$base/data/de-nl
configs=$base/configs

translations=$base/translations

mkdir -p $translations

src=de
trg=nl

# cloned from https://github.com/bricksdont/moses-scripts
MOSES=$base/tools/moses-scripts/scripts

num_threads=4
device=0

# measure time

SECONDS=0

# evaluate model (a) transformer_sample_config_tokenized

model_name=transformer_sample_config_tokenized

echo "###############################################################################"
echo "model_name $model_name"

translations_sub=$translations/$model_name

mkdir -p $translations_sub

CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python -m joeynmt translate $configs/$model_name.yaml < $data/test.de-nl.tokenized.$src > $translations_sub/test.de-nl.tokenized.$model_name.$trg

# undo BPE

#cat $translations_sub/test.bpe.$model_name.$trg | sed 's/\@\@ //g' > $translations_sub/test.truecased.$model_name.$trg

# undo tokenization

cat $translations_sub/test.de-nl.tokenized.$model_name.$trg | $MOSES/tokenizer/detokenizer.perl -l $trg > $translations_sub/test.$model_name.$trg

# compute case-sensitive BLEU on detokenized data

cat $translations_sub/test.$model_name.$trg | sacrebleu $data/test.de-nl.$trg


# evaluate model (b) transformer_sample_config_bpe2k
model_name=transformer_sample_config_bpe2k

echo "###############################################################################"
echo "model_name $model_name"

translations_sub=$translations/$model_name

mkdir -p $translations_sub

CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python -m joeynmt translate $configs/$model_name.yaml < $data/test.de-nl.bpe2k.$src > $translations_sub/test.bpe2k.$model_name.$trg

# undo BPE

cat $translations_sub/test.bpe2k.$model_name.$trg | sed 's/\@\@ //g' > $translations_sub/test.truecased.$model_name.$trg

# undo tokenization

cat $translations_sub/test.truecased.$model_name.$trg | $MOSES/tokenizer/detokenizer.perl -l $trg > $translations_sub/test.$model_name.$trg

# compute case-sensitive BLEU on detokenized data

cat $translations_sub/test.$model_name.$trg | sacrebleu $data/test.de-nl.$trg


# evaluate model (c) transformer_sample_config_bpe5k
model_name=transformer_sample_config_bpe5k

echo "###############################################################################"
echo "model_name $model_name"

translations_sub=$translations/$model_name

mkdir -p $translations_sub

CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python -m joeynmt translate $configs/$model_name.yaml < $data/test.de-nl.bpe5k.$src > $translations_sub/test.bpe5k.$model_name.$trg

# undo BPE

cat $translations_sub/test.bpe5k.$model_name.$trg | sed 's/\@\@ //g' > $translations_sub/test.truecased.$model_name.$trg

# undo tokenization

cat $translations_sub/test.truecased.$model_name.$trg | $MOSES/tokenizer/detokenizer.perl -l $trg > $translations_sub/test.$model_name.$trg

# compute case-sensitive BLEU on detokenized data

cat $translations_sub/test.$model_name.$trg | sacrebleu $data/test.de-nl.$trg

echo "time taken:"
echo "$SECONDS seconds"
