#!/bin/bash

USER_NAME=$1
GROUP_NAME=$2
GENERATED_PASSWORD=$(LC_ALL=C tr -dc A-Za-z0-9_\!\@\#\$\%\^\&\*\(\)-+= < /dev/urandom | head -c 128 | xargs)

aws iam create-user --user-name $USER_NAME --no-cli-pager
aws iam create-login-profile --user-name $USER_NAME --password $GENERATED_PASSWORD --password-reset-required --no-cli-pager
aws iam add-user-to-group --user-name $USER_NAME --group-name $GROUP_NAME

echo ""
echo "For new user: please enter aws console with credential below" 
echo "Username: $USER_NAME"
echo "Password: $GENERATED_PASSWORD"

