FROM centos:7

RUN yum -y upgrade
RUN yum -y install curl vim sudo wget

COPY nginx.repo /etc/yum.repos.d/nginx.repo
RUN yum -y update

RUN yum -y install nginx

COPY nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT ["nginx &"]