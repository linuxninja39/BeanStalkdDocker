#!/bin/bash

#aws ecr create-repository --repository-name beanstalkd
#aws ecr create-repository --repository-name beanstalkd-publisher
#aws ecr create-repository --repository-name beanstalkd-subscriber

aws iam --region us-west-2 create-role --role-name ecsTaskExecutionRole --assume-role-policy-document file://policy.json
aws iam --region us-west-2 attach-role-policy --role-name ecsTaskExecutionRole --policy-arn arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy
aws iam --region us-west-2 attach-role-policy --role-name ecsTaskExecutionRole --policy-arn arn:aws:iam::aws:policy/CloudWatchLogsFullAccess


ecs-cli configure --cluster beanstalkd --region us-west-2 --default-launch-type EC2
ecs-cli up --capability-iam --force --instance-type t2.medium
