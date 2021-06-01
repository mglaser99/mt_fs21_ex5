# 2 Experiments with Byte Pair Encoding

For this exercise I chose the translation direction de-nl. All the steps are therefore only run on the respective data.

I added multiple shell scripts that run all the required steps of exercise 2. To run them in the right order I added them to the instructions below.

None of the scripts should need any further changes except for train.sh. In order to train the different models with the script the variable model_name in the script needs to be adapted to the respective model name.

# 3 Impact of beam size on translation quality

The evaluate_beamsize.sh script evaluates the transformer_sample_config_bpe5k model with 10 different beam sizes from 1-10.

# mt_fs21_ex5

This repo is just a collection of scripts showing how to install [JoeyNMT](https://github.com/joeynmt/joeynmt), download
data and train & evaluate models.

# Requirements

- This only works on a Unix-like system, with bash.
- Python 3 must be installed on your system, i.e. the command `python3` must be available
- Make sure virtualenv is installed on your system. To install, e.g.

    `pip install virtualenv`

# Steps

Clone this repository in the desired place:

    git clone https://github.com/lucasseiler/mt_fs21_ex5

Create a new virtualenv that uses Python 3. Please make sure to run this command outside of any virtual Python environment:

    ./scripts/make_virtualenv.sh

**Important**: Then activate the env by executing the `source` command that is output by the shell script above.

Download and install required software:

    ./scripts/download_install_packages.sh

Download data:

    ./download_iwslt_2017_data.sh

Create train files with 100k samples:
	
	./scripts/sub_samples.sh

Tokenize the data:

	./scripts/tokenize.sh

Train two BPE models (with vocab sizes 2k and 5k):

	./scripts/train_bpe_model.sh

Apply BPE models on data:

	./scripts/bpe_tokenize.sh

Build joint vocabulary for the BPE-level JoeyNMT model:

	./scripts/build_joint_vocab.sh

Train a model:

    ./scripts/train.sh

The training process can be interrupted at any time, and the best checkpoint will always be saved.

Evaluate a trained model with (the scripts evaluates all 3 models):

    ./scripts/evaluate.sh

Evaluate a model with 10 different beam sizes:

	./scripts/evaluate_beamsize.sh