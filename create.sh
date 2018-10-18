#!/bin/bash

STACK_NAME=k0

REGION=us-east-1

AWS_PROFILE=default

SHARD_COUNT=2
RETENTION_HOURS=24

BUFFER_SECONDS=900
BUFFER_SIZE=128

BILLING_CODE=$STACK_NAME

aws cloudformation create-stack \
  --region $REGION \
  --stack-name $STACK_NAME \
  --template-body file://apig-kinesis-s3.cfn.yml \
  --profile $AWS_PROFILE \
  --capabilities CAPABILITY_NAMED_IAM \
  --parameters \
  ParameterKey=IngestionKinesisDataStreamShardCount,ParameterValue=$SHARD_COUNT \
  ParameterKey=IngestionKinesisDataStreamRetentionHours,ParameterValue=$RETENTION_HOURS \
  ParameterKey=IngestionKinesisDataStreamBufferIntervalInSeconds,ParameterValue=$BUFFER_SECONDS \
  ParameterKey=IngestionKinesisDataStreamBufferSizeInMBs,ParameterValue=$BUFFER_SIZE \
  ParameterKey=BillingCode,ParameterValue=$BILLING_CODE


