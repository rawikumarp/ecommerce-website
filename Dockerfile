FROM centos:latest

RUN sudo yum update

RUN sudo yum install httpd -y

ADD . /var/www/html/
