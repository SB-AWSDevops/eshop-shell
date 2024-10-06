#!/bin/bash

instances=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "web");

for instance in ${instances[@]}; do
    echo "Creating instance for : $instance"
done