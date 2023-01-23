FROM centos:latest

RUN  yum update

RUN  yum install httpd -y

ADD . /var/www/html/
