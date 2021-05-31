scripts=`dirname "$0"`
base=$scripts/..

data=$base/data/de-nl
models=$base/models

src=de
trg=nl

# apply bpe model with 2k vocab size
# apply bpe on training data

subword-nmt apply-bpe -c $models/bpe_2k_model --vocabulary $data/vocab/vocab_2k.$src \
--vocabulary-threshold 10 < $data/train.de-nl.100k.tokenized.$src > $data/train.de-nl.100k.bpe2k.$src

subword-nmt apply-bpe -c $models/bpe_2k_model --vocabulary $data/vocab/vocab_2k.$trg \
--vocabulary-threshold 10 < $data/train.de-nl.100k.tokenized.$trg > $data/train.de-nl.100k.bpe2k.$trg

# apply bpe on test data

subword-nmt apply-bpe -c $models/bpe_2k_model --vocabulary $data/vocab/vocab_2k.$src \
--vocabulary-threshold 10 < $data/test.de-nl.tokenized.$src > $data/test.de-nl.bpe2k.$src

subword-nmt apply-bpe -c $models/bpe_2k_model --vocabulary $data/vocab/vocab_2k.$trg \
--vocabulary-threshold 10 < $data/test.de-nl.tokenized.$trg > $data/test.de-nl.bpe2k.$trg

# apply bpe on dev data

subword-nmt apply-bpe -c $models/bpe_2k_model --vocabulary $data/vocab/vocab_2k.$src \
--vocabulary-threshold 10 < $data/dev.de-nl.tokenized.$src > $data/dev.de-nl.bpe2k.$src

subword-nmt apply-bpe -c $models/bpe_2k_model --vocabulary $data/vocab/vocab_2k.$trg \
--vocabulary-threshold 10 < $data/dev.de-nl.tokenized.$trg > $data/dev.de-nl.bpe2k.$trg

# apply bpe model with 5k vocab size
# apply bpe on training data

subword-nmt apply-bpe -c $models/bpe_5k_model --vocabulary $data/vocab/vocab_5k.$src \
--vocabulary-threshold 10 < $data/train.de-nl.100k.tokenized.$src > $data/train.de-nl.100k.bpe5k.$src

subword-nmt apply-bpe -c $models/bpe_5k_model --vocabulary $data/vocab/vocab_5k.$trg \
--vocabulary-threshold 10 < $data/train.de-nl.100k.tokenized.$trg > $data/train.de-nl.100k.bpe5k.$trg

# apply bpe on test data

subword-nmt apply-bpe -c $models/bpe_5k_model --vocabulary $data/vocab/vocab_5k.$src \
--vocabulary-threshold 10 < $data/test.de-nl.tokenized.$src > $data/test.de-nl.bpe5k.$src

subword-nmt apply-bpe -c $models/bpe_5k_model --vocabulary $data/vocab/vocab_5k.$trg \
--vocabulary-threshold 10 < $data/test.de-nl.tokenized.$trg > $data/test.de-nl.bpe5k.$trg

# apply bpe on dev data

subword-nmt apply-bpe -c $models/bpe_5k_model --vocabulary $data/vocab/vocab_5k.$src \
--vocabulary-threshold 10 < $data/dev.de-nl.tokenized.$src > $data/dev.de-nl.bpe5k.$src

subword-nmt apply-bpe -c $models/bpe_5k_model --vocabulary $data/vocab/vocab_5k.$trg \
--vocabulary-threshold 10 < $data/dev.de-nl.tokenized.$trg > $data/dev.de-nl.bpe5k.$trg