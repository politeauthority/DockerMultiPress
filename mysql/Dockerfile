FROM mysql:latest

MAINTAINER Booj Data "data@booj.com"

ENV MYSQL_ROOT_PASSWORD=cleancut
ENV MYSQL_USER=wpadmin
ENV MYSQL_PASSWORD=cleancut

EXPOSE 3306

ADD ./init.sql /root/init.sql

RUN echo 'bind-address:0.0.0.0' >> /etc/mysql/my.conf