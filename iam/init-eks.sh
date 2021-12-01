#!/bin/bash

CLUSTER_NAME=$1
ROLE=$2

ROLE_ARN=$(aws iam list-roles \
  | jq -r ".Roles[] \
    | select(.RoleName | contains(\"$ROLE\")) \
    | .Arn" \
  | head -1)

aws eks update-kubeconfig --name $CLUSTER_NAME \
  --alias $CLUSTER_NAME-$ROLE \
  --role-arn $ROLE_ARN

