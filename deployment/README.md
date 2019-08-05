# Beanstalkd Docker Service

## How to install Docker in Ubuntu 18.04
```
sudo -i
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt update
apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
apt install -y docker-ce docker-compose
apt install -y gnupg2 pass
```

## How to deploy everything on AWS ECS
```
Install AWS CLI and ECS CLI 
Run beanstalkd/deployment/initialize.sh (Only if first time)
Update repository path in all other deploy.sh and docker-compose.yml files manually (Only first time)

Run beanstalkd/deploy.sh
Run beanstalkd-publisher/deploy.sh
Run beanstalkd-subscriber/deploy.sh
Run beanstalkd/deployment/deploy.sh
```

## How to find public IP of AWS ECS instance
Since it use AWS in background, you can find it in EC2 -> Instance -> IPv4 Public IP

## How to push data to beanstalkd using Falcon REST API
```    
curl -X POST http://127.0.0.1/publish -H "Content-Type: application/json" -d '["dataa", "datab"]'
```
