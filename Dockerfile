FROM debian
ADD docker.list /etc/apt/sources.list.d/
MAINTAINER sveta <tanaevasvetlana00@gmail.com>
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install nginx && \
    apt-get clean && \
    rm -rf /var/www/* && \
    mkdir -p /var/www/sveta.com/img && \
    chmod -R 754 /var/www/sveta.com/ && \
    useradd Sveta && \
    groupadd Tanaeva && \
    usermod -aG Tanaeva Sveta && \
    chown -R Sveta:Tanaeva /var/www/sveta.com/ && \
    sed -i 's/\/var\/www\/html/\/var\/www\/sveta.com/g' /etc/nginx/sites-enabled/default && \
    sed -i 's/user www-data/user Sveta/g' /etc/nginx/nginx.conf
ADD img.jpg /var/www/sveta.com/img/
ADD index.html /var/www/sveta.com/
CMD ["nginx", "-g", "daemon off;"]
