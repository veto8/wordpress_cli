FROM wordpress:cli 
LABEL version="0.1"
MAINTAINER veto<veto@myridia.com>
USER root
WORKDIR /root

RUN apk upgrade 
RUN apk add rsync wget sshpass openssh
RUN wget https://getcomposer.org/composer.phar 
RUN chmod +x composer.phar
RUN mv ./composer.phar /usr/bin/composer
WORKDIR /var/www/html
VOLUME /var/www/html

USER root
# USER www-data
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]


#CMD ["wp", "shell"]
#ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]


