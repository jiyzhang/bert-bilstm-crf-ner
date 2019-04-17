#!/bin/bash

DO_TRAIN="False"
DO_PREDICT="False"
DO_EVAL="False"

if [ $1 = '100' ] 
then
   DO_TRAIN="True"
elif [ $1 = '010' ] 
then
   DO_EVAL="True"
else
   DO_PREDICT="True"
fi

OUTPUT=$2
DATAFORMAT=$3
CRF_ONLY=$4

export BERT_BASE_DIR=gs://bucket220209/checkpoint
export BERT_OUTPUT_DIR=gs://zjythesis/output
export BERT_DATA_DIR=gs://bucket220209/data

# echo python3 bert_bilstm_crf_ner.py  --task_name="ner"  --data_dir=$BERT_DATA_DIR --bert_config_file=$BERT_BASE_DIR/bert_config.json --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt --vocab_file=$BERT_BASE_DIR/vocab.txt  --output_dir=$BERT_OUTPUT_DIR/${OUTPUT}/ --use_tpu=True --tpu_name=$TPU_NAME --do_train=${DO_TRAIN} --do_eval=${DO_EVAL} --do_predict=${DO_PREDICT} --datasetformat=\"${DATAFORMAT}\" --crf_only=$CRF_ONLY

echo "python3 bert_bilstm_crf_ner.py \\
    --task_name=\"ner\" \\
    --data_dir=$BERT_DATA_DIR \\
    --bert_config_file=$BERT_BASE_DIR/bert_config.json \\
    --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \\
    --vocab_file=$BERT_BASE_DIR/vocab.txt \\
    --output_dir=$BERT_OUTPUT_DIR/${OUTPUT}/ \\
    --use_tpu=True \\
    --tpu_name=$TPU_NAME \\
    --do_train=${DO_TRAIN} \\
    --do_eval=${DO_EVAL} \\
    --do_predict=${DO_PREDICT} \\
    --datasetformat=${DATAFORMAT} \\
    --crf_only=$CRF_ONLY"

python3 bert_bilstm_crf_ner.py \
    --task_name="ner" \
    --data_dir=$BERT_DATA_DIR \
    --bert_config_file=$BERT_BASE_DIR/bert_config.json \
    --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
    --vocab_file=$BERT_BASE_DIR/vocab.txt \
    --output_dir=$BERT_OUTPUT_DIR/${OUTPUT}/ \
    --use_tpu=True \
    --tpu_name=$TPU_NAME \
    --do_train=${DO_TRAIN} \
    --do_eval=${DO_EVAL} \
    --do_predict=${DO_PREDICT} \
    --datasetformat=${DATAFORMAT} \
    --crf_only=$CRF_ONLY
