FROM centos:7

RUN yum -y upgrade
RUN yum -y install curl vim sudo wget

COPY /app/sigsci.repo /etc/yum.repos.d/sigsci.repo
COPY /app/nginx.repo /etc/yum.repos.d/nginx.repo
RUN yum -y update

RUN yum -y install nginx-1.10.3

# Step 2 - Install the Signal Sciences Agent Package
RUN yum -y install sigsci-agent

#RUN mkdir /app && mkdir /etc/sigsci
COPY /agent.conf /etc/sigsci/agent.conf

# Step 3 - Install the sigsci module
RUN yum -y install nginx110-lua-module
RUN yum -y install sigsci-module-nginx

COPY /app/nginx.conf /etc/nginx/nginx.conf
COPY /app/sigsci.conf /opt/sigsci/nginx/sigsci.conf

COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

ENTRYPOINT ["/app/start.sh"]
