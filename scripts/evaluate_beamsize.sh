#! /bin/bash

scripts=`dirname "$0"`
base=$scripts/..

data=$base/data/de-nl
configs=$base/configs

translations=$base/translations/beam_eval

mkdir -p $translations

src=de
trg=nl

# cloned from https://github.com/bricksdont/moses-scripts
MOSES=$base/tools/moses-scripts/scripts

num_threads=4
device=0

# measure time

SECONDS=0

# evaluate model (c) transformer_sample_config_bpe5k wit beam sizes from 1-10

model_name=transformer_sample_config_bpe5k_beam1

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


model_name=transformer_sample_config_bpe5k_beam2

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


model_name=transformer_sample_config_bpe5k_beam3

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


model_name=transformer_sample_config_bpe5k_beam4

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


model_name=transformer_sample_config_bpe5k_beam6

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


model_name=transformer_sample_config_bpe5k_beam7

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


model_name=transformer_sample_config_bpe5k_beam8

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


model_name=transformer_sample_config_bpe5k_beam9

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


model_name=transformer_sample_config_bpe5k_beam10

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