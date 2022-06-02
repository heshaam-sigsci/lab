FROM ubuntu:18.04

RUN apt-get update && apt-get install -y curl wget vim apache2 haproxy
RUN apt-get install -y lua5.3
#download and unpack SigSci Agent
RUN cd /usr/sbin && curl -O https://dl.signalsciences.net/sigsci-agent/sigsci-agent_latest.tar.gz && tar -xvzf sigsci-agent_latest.tar.gz
RUN mkdir /usr/local/lib/lua && mkdir /usr/local/lib/lua/5.3 && mkdir /usr/local/lib/lua/5.3/sigsci
RUN cd /usr/local/lib/lua/5.3/sigsci && wget https://dl.signalsciences.net/sigsci-module-haproxy/sigsci-module-haproxy_latest.tar.gz && tar -xf sigsci-module-haproxy_latest.tar.gz

RUN mkdir /app && mkdir /etc/sigsci && mkdir /run/haproxy
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh
COPY app/haproxy.cfg /etc/haproxy/haproxy.cfg
COPY app/index.html /var/www/html/index.html

ENTRYPOINT ["/app/start.sh"]

