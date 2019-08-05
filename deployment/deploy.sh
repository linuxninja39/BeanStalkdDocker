#!/bin/bash

ecs-cli configure --cluster beanstalkd --region eu-central-1 --default-launch-type EC2

ecs-cli compose --project-name beanstalkd --task-role-arn ecsTaskExecutionRole service up --create-log-groups --cluster beanstalkd --deployment-min-healthy-percent 0
