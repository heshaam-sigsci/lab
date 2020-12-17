FROM amazonlinux:2018.03

RUN mkdir /etc/ssl/nginx && cd /etc/ssl/nginx
COPY nginx-repo.crt /etc/ssl/nginx/
COPY nginx-repo.key /etc/ssl/nginx/
COPY sigsci.repo /etc/yum.repos.d/sigsci.repo

RUN yum install -y ca-certificates wget 
RUN wget -P /etc/yum.repos.d https://cs.nginx.com/static/files/nginx-plus-amazon.repo
RUN yum install -y nginx-plus
RUN yum install -y nginx-module-sigsci-nxp-amzn-1.17.3 sigsci-agent

COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

COPY start.sh /start.sh
RUN chmod +x start.sh
ENTRYPOINT ["/start.sh"]

