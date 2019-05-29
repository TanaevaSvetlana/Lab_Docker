FROM debian
ADD docker.list /etc/apt/sources.list.d/
MAINTAINER sveta
RUN apt-get update && apt-get -y upgrade && apt -y install nginx && apt-get clean && \
    cd /var/www/ && rm -rf ./* && mkdir -p sveta.com/img && \
    
