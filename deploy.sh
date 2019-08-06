#!/bin/sh

repository="542516710673.dkr.ecr.us-west-2.amazonaws.com"

$(aws ecr get-login --no-include-email)
docker build . -t beanstalkd:latest -t $repository/beanstalkd:latest
docker push $repository/beanstalkd:latest
