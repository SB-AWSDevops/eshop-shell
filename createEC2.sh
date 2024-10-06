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