"""
测试数据读入功能 __read_data_conll or __read_data_wind

python3 ./test_read_data.py --data_dir=$BERT_DATA_DIR  --datasetformat=wind
"""

import collections
import os

import pickle
import codecs
import logging

import tensorflow as tf
from bert import tokenization

from bert_bilstm_crf_ner import NerProcessor
from bert_bilstm_crf_ner import FLAGS

p = NerProcessor()
train_example = p.get_train_examples(FLAGS.data_dir)
limit = 5
i = 0

print("total number of examples: {}".format(len(train_example)))

for line in train_example:
    if i < limit:
        print(line.guid)
        print(line.text)
        print(line.label)
        print("*" * 100)
        i = i + 1
    else:
        break


