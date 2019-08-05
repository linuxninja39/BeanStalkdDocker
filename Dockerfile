FROM ubuntu:18.04
LABEL maintainer="Varun Agrawal <Varun@VarunAgw.com>"

RUN apt-get update
RUN apt-get install -y beanstalkd

CMD ["/usr/bin/beanstalkd"]
