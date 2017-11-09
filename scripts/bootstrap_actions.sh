#!/usr/bin/env bash

# install conda
wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh \
    && /bin/bash ~/miniconda.sh -b -p $HOME/conda

echo -e '\nexport PATH=$HOME/conda/bin:$PATH' >> $HOME/.bashrc && source $HOME/.bashrc

# install packages
conda install -y ipython jupyter

# if you want this to work on pyspark it needs to be installed via sudo
pip install pandas
pip install nltk

#copy stuff form S3 onto cluster
aws s3 cp  s3://your_bucket/ . --recursive