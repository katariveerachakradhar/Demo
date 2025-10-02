#!/bin/bash
source ./variables.sh
echo "Launching EC2 instance"
aws ec2 run-instances \
  --image-id "$AMI_ID" \
  --count "$COUNT" \
  --instance-type "$INSTANCE_TYPE" \
  --security-group-ids "$SECURITY_GROUP_IDS" \
  --subnet-id "$SUBNET_ID" \
  --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$TAG_NAME}]" \
  --region "$REGION" \
  --output json

echo "EC2 launched"
