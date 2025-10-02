#!/bin/bash

# Replace these variables with your values
AMI_ID="ami-09c813fb71547fc4f"       # The ID of the AMI to use
INSTANCE_TYPE="t2.micro"              # Instance type
KEY_NAME="daws-84s"                # Your EC2 key pair name
SECURITY_GROUP_ID="sg-058c3a47b82e88b3a"  # Security group ID
SUBNET_ID="subnet-06c1dd3be6de657c0" # Subnet ID (optional, but recommended)
REGION="us-east-1"                   # AWS Region
TAG_NAME="Shell EC2"

# Launching EC2 instance with minimal parameters
aws ec2 run-instances \
  --image-id $AMI_ID \
  --count 1 \
  --instance-type $INSTANCE_TYPE \
  --key-name $KEY_NAME \
  --security-group-ids $SECURITY_GROUP_ID \
  --subnet-id $SUBNET_ID \
  --region $REGION \
  --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$TAG_NAME}]" \
  --output json

echo "EC2 instance launch attempted"
