FROM amazonlinux:1

RUN yum -y upgrade
RUN yum -y install curl vim sudo wget sed

# Step 1 - Add the Package Repositories
COPY sigsci.repo /etc/yum.repos.d/sigsci.repo

RUN yum -y update

#RUN amazon-linux-extras list | grep nginx
#RUN amazon-linux-extras enable nginx1

RUN yum clean metadata
RUN yum -y install nginx

# Set up some server stuff
RUN mkdir /app && mkdir /etc/sigsci
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

# Step 2 - Install the Signal Sciences Agent Package
RUN sudo yum -y install sigsci-agent

# Step 3 - Install the Signal Sciences Apache Module
#RUN yum -y install nginx-module-sigsci-nxo-1.20.0*

COPY /app/nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT ["/app/start.sh"]
