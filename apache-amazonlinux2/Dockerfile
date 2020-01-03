FROM amazonlinux:2

RUN yum -y upgrade
RUN yum -y install httpd sed curl vim sudo
RUN yum install -y apt-transport-https wget
RUN yum update

# Set up some server stuff
RUN mkdir /app && mkdir /etc/sigsci
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

# Step 1 - Add the Package Repositories
COPY sigsci.repo /etc/yum.repos.d/sigsci.repo

# Step 2 - Install the Signal Sciences Agent Package
RUN sudo yum -y install sigsci-agent


# Step 3 - Install the Signal Sciences Apache Module
RUN sudo yum install -y sigsci-module-apache
COPY app/httpd.conf /etc/httpd/conf/httpd.conf
COPY app/index.html /var/www/html/index.html
COPY app/login.html /var/www/html/login/index.html

ENTRYPOINT ["/app/start.sh"]
