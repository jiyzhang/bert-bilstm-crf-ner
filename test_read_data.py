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
for line in train_example:
    if i < limit:
        print(line.guid)
        print(line.text)
        print(line.label)
        print("*" * 100)
        i = i + 1
    else:
        break


