scripts=`dirname "$0"`
base=$scripts/..

data=$base/data/de-nl

src=de
trg=nl

# build joint vocab for 2k bpe model files

python tools/joeynmt/scripts/build_vocab.py $data/train.de-nl.100k.bpe2k.$src $data/train.de-nl.100k.bpe2k.$trg \
--output_path $data/vocab/joint_vocab.2k.bpe

# build joint vocab for 5k bpe model files

python tools/joeynmt/scripts/build_vocab.py $data/train.de-nl.100k.bpe5k.$src $data/train.de-nl.100k.bpe5k.$trg \
--output_path $data/vocab/joint_vocab.5k.bpe