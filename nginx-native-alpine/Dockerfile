FROM alpine:latest

RUN apk update && apk add --no-cache ca-certificates curl wget
RUN apk add linux-headers

RUN mkdir -p /run/nginx
RUN mkdir -p /usr/share/nginx

RUN wget -q https://apk.signalsciences.net/sigsci_apk.pub ; mv sigsci_apk.pub /etc/apk/keys/
RUN echo https://apk.signalsciences.net/3.11/main | tee -a /etc/apk/repositories && apk update

RUN apk add nginx

#RUN wget https://dl.signalsciences.net/sigsci-agent/sigsci-agent_latest.tar.gz && tar -xvf sigsci-agent_latest.tar.gz
#RUN apk add sigsci-agent
RUN apk search -qe 'sigsci-agent*' | xargs apk add

RUN mkdir /app
#RUN mkdir /app && mkdir /etc/sigsci
COPY agent.conf /etc/sigsci/agent.conf

#RUN apk add nginx-module-sigsci-nxo-1.16.1
RUN apk search -qe 'nginx-module-sigsci-nxo-1.16.1*' | xargs apk add

COPY /app/nginx.conf /etc/nginx/nginx.conf

COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh


ENTRYPOINT ["/app/start.sh"]
