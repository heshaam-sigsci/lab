FROM kong

USER root

RUN apk add curl

## Install Signal Sciences Agent
RUN curl -O https://dl.signalsciences.net/sigsci-agent/sigsci-agent_latest.tar.gz
RUN tar -xf sigsci-agent_latest.tar.gz -C /usr/sbin/

## Install Signal Sciences Kong Module
RUN curl -O  https://dl.signalsciences.net/sigsci-module-nginx/sigsci-module-nginx_latest.tar.gz
RUN mkdir -p /opt/sigsci/nginx
RUN tar -xf sigsci-module-nginx_latest.tar.gz -C /opt/sigsci/nginx
RUN cd /opt/sigsci/nginx && mv ./sigsci-module-nginx/* ./ && rm -r ./sigsci-module-nginx
RUN sed -i 's/sigsci.agentport = 12345/sigsci.agentport = 737/g' /opt/sigsci/nginx/kong/plugins/signalsciences/handler.lua

## Copy Kong.conf with Signal Sciences Module enabled
COPY kong.conf /etc/kong/kong.conf

COPY start.sh /start.sh
RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]
