#!/bin/bash

source ./variables.sh

echo "Launching EC2 instance"

aws ec2 run-instance\
    image-id="$AMI_ID" \
    count="$COUNT" \
    instance-type="$INSTANCE_TYPE"\
    security-group="$SECURITY_GROUP_IDS" \
    subnet-id="$SUBNET_ID" \
    tag-specifications "ResouceType=instance, Tags=[{value=$TAG_NAME}]"\
    region "$REGION" \
    output json
    
echo "EC2 launched"





