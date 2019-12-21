FROM centos:7

RUN yum install -y sudo vim

COPY /app/sigsci.repo /etc/yum.repos.d/sigsci.repo

RUN mkdir /etc/ssl/nginx && cd /etc/ssl/nginx
COPY nginx-repo.crt /etc/ssl/nginx/
COPY nginx-repo.key /etc/ssl/nginx/

RUN yum install -y ca-certificates wget
RUN wget -P /etc/yum.repos.d https://cs.nginx.com/static/files/nginx-plus-7.4.repo 
RUN yum install -y nginx-plus-18

# Step 2 - Install the Signal Sciences Agent Package
RUN yum -y install sigsci-agent

#RUN mkdir /app && mkdir /etc/sigsci
COPY agent.conf /etc/sigsci/agent.conf

#Extra step to manually install the NGINX NDK
RUN yum -y install nginx-plus-module-ndk-18+0.3.0

# Step 3 - Install the Signal Sciences Module
RUN yum -y install nginx-module-sigsci-nxp-1.15.10*

COPY /app/nginx.conf /etc/nginx/nginx.conf

COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

#CMD ["nginx", "-g", "daemon off;"]
ENTRYPOINT ["/app/start.sh"]