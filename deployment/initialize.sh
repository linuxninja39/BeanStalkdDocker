#!/bin/bash

aws ecr create-repository --repository-name beanstalkd
aws ecr create-repository --repository-name beanstalkd-publisher
aws ecr create-repository --repository-name beanstalkd-subscriber

aws iam --region eu-central-1 create-role --role-name ecsTaskExecutionRole --assume-role-policy-document file://policy.json
aws iam --region eu-central-1 attach-role-policy --role-name ecsTaskExecutionRole --policy-arn arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy
aws iam --region eu-central-1 attach-role-policy --role-name ecsTaskExecutionRole --policy-arn arn:aws:iam::aws:policy/CloudWatchLogsFullAccess


ecs-cli configure --cluster beanstalkd --region eu-central-1 --default-launch-type EC2
ecs-cli up --capability-iam --force --instance-type t2.medium
