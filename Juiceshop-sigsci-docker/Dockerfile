#FROM bkimminich/juice-shop:v12.6.1
FROM bkimminich/juice-shop:latest
WORKDIR /juice-shop

USER root
RUN apk update && apk add --no-cache git curl perl python python-dev py-pip

RUN curl https://dl.signalsciences.net/sigsci-agent/sigsci-agent_latest.tar.gz -o agent.tar.gz && tar -xzf agent.tar.gz && mv sigsci-agent-diag /usr/sbin/ && mv sigsci-agent /usr/sbin/ && rm agent.tar.gz

RUN npm install https://dl.signalsciences.net/sigsci-module-nodejs/sigsci-module-nodejs_latest.tgz
RUN chmod +x /usr/sbin/sigsci-agent && chmod +x /usr/sbin/sigsci-agent-diag
COPY start.sh start.sh
RUN chmod +x start.sh


EXPOSE  3000
ENTRYPOINT ["./start.sh"]