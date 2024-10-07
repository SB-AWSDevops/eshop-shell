#!/bin/bash

instances=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "web");

for instance in ${instances[@]}; do
    if [ $instance == "shipping" ] || [ $instance == "mysql" ]
    then
        instance_type="t3.medium"
    else
        instance_type="t3.micro"
    fi
    echo "Creating instance for : $instance with instance type : $instance_type" 
done
#retrieve the default values:
ami_id=$(aws ec2 describe-images --owners amazon --filters "Name=platform,Values=linux" --query "Images[?Name=='amzn2-ami-hvm-*-x86_64-gp2'].ImageId" --output text --region <us-east-1>)
subnet_id=$(aws ec2 describe-subnets --filters Name=default-for-az,Values=true --query 'Subnets[0].SubnetId' --output text --region <us-east-1>)
sg_id=$(aws ec2 describe-security-groups --filters Name=group-name,Values=default --query 'SecurityGroups[0].GroupId' --output text --region <us-east-1>)

# use the values to launch the instance:
aws ec2 run-instances \
    --image-id $ami_id \
    --instance-type $instance_type \
    --key-name suri \
    --security-group-ids $sg_id \
    --subnet-id $subnet_id \
    --region us-east-1

# Check if the command was successful
    if [ $? -eq 0 ]; then
        echo "Instance for $instance created successfully!"
    else
        echo "Failed to create instance for $instance."
    fi
done
