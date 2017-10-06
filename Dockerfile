#Dockerfile
FROM nimmis/apache-php5

MAINTAINER "Roberto Santini" <roberto.santini89@gmail.com>

RUN apt update && apt install unzip
RUN cd /var/www/html \
&& rm index.* && wget -qO- -O temp.zip https://github.com/devcode-it/openstamanager/releases/download/v2.3-beta.2/openstamanager-2.3beta2.zip && unzip temp.zip && rm temp.zip && chmod 777 -R ./

RUN rm /etc/apache2/mods-enabled/dir.conf
COPY dir.conf /etc/apache2/mods-enabled/

EXPOSE 8080
EXPOSE 80
