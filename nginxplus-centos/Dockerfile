FROM centos:7

RUN yum install -y sudo vim

RUN mkdir /etc/ssl/nginx && cd /etc/ssl/nginx
COPY nginx-repo.crt /etc/ssl/nginx/
COPY nginx-repo.key /etc/ssl/nginx/

RUN yum install -y ca-certificates wget
RUN wget -P /etc/yum.repos.d https://cs.nginx.com/static/files/nginx-plus-7.4.repo 
RUN yum install -y nginx-plus
