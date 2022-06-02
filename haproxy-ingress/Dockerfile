FROM haproxytech/kubernetes-ingress:1.4.13

RUN apk update && apk add --no-cache openssl-dev apache2 ca-certificates curl wget make build-base readline-dev 

RUN curl -R -O http://www.lua.org/ftp/lua-5.3.5.tar.gz && tar zxf lua-5.3.5.tar.gz && cd lua-5.3.5 && make linux test

#Download Signal Sciences HAProxy module
RUN wget https://dl.signalsciences.net/sigsci-module-haproxy/1.2.0/alpine/3.6/sigsci-module-haproxy_1.2.0-3.6_all.apk && apk add --allow-untrusted sigsci-module-haproxy_1.2.0-3.6_all.apk

#Download Signal Sciences Agent
RUN wget https://dl.signalsciences.net/sigsci-agent/sigsci-agent_latest.tar.gz && tar -xvf sigsci-agent_latest.tar.gz

RUN mkdir /app && mkdir /etc/sigsci && mkdir /run/haproxy #&& mkdir /run/apache2
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh
COPY app/httpd.conf /etc/apache2/httpd.conf
COPY app/haproxy.cfg /etc/haproxy/haproxy.cfg
COPY app/index.html /var/www/localhost/htdocs/index.html

ENTRYPOINT ["/app/start.sh"]

