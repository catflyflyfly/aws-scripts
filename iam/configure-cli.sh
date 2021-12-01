#!bin/bash

PROFILE_NAME=$1

aws configure --profile $PROFILE_NAME

aws iam create-access-key --user-name $PROFILE_NAME > /tmp/aws_key.json

aws configure --profile $PROFILE_NAME set aws_access_key_id $(cat /tmp/aws_key.json | jq -r '.AccessKey.AccessKeyId')
aws configure --profile $PROFILE_NAME set aws_secret_access_key $(cat /tmp/aws_key.json | jq -r '.AccessKey.SecretAccessKey')
aws configure --profile $PROFILE_NAME set region asia-southeast-1
aws configure --profile $PROFILE_NAME set output json

rm -rf /tmp/aws_key.json
