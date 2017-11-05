#!/bin/bash
source ~/tensorflow/bin/activate
dataset=$1
if [ ! -d "./data_proc/${dataset}/" ]; then
    mkdir -p ./data_proc/${dataset}/
fi
python preprocess.py --input ./data_raw/${dataset}/ --output ./data_proc/${dataset}/ --vocab ./data_raw/${dataset}/${dataset}.vocab
python train.py --dataset ./data_proc/${dataset}/ --model ./model/${dataset}/ --vocab-size 15536