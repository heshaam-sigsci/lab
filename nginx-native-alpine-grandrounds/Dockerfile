FROM nginx:1.17.5-alpine

RUN apk update && apk add --no-cache ca-certificates curl wget

#RUN wget https://dl.signalsciences.net/sigsci-agent/sigsci-agent_latest.tar.gz && tar -xvf sigsci-agent_latest.tar.gz
RUN wget -q https://apk.signalsciences.net/sigsci_apk.pub ; mv sigsci_apk.pub /etc/apk/keys/
RUN echo https://apk.signalsciences.net/3.11/main | tee -a /etc/apk/repositories && apk update

#RUN apk add sigsci-agent
RUN apk search -qe 'sigsci-agent*' | xargs apk add

#RUN mkdir /app && mkdir /etc/sigsci
COPY agent.conf /etc/sigsci/agent.conf

RUN apk search -qe 'nginx-module-sigsci-nxo-1.17.5*' | xargs apk add

COPY /app/nginx.conf /etc/nginx/nginx.conf

COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh


ENTRYPOINT ["/app/start.sh"]
