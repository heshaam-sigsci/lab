FROM debian:8

RUN apt-get update
RUN apt-get install -y apt-transport-https wget
RUN wget -qO - https://apt.signalsciences.net/gpg.key | apt-key add - &&  echo "deb https://apt.signalsciences.net/release/debian/ jessie main" |  tee /etc/apt/sources.list.d/sigsci-release.list && apt-get update
RUN apt-get install -y apache2
RUN apt-get install -y sigsci-agent
#RUN wget https://dl.signalsciences.net/sigsci-agent/sigsci-agent_latest.tar.gz && tar -xvf sigsci-agent_latest.tar.gz
RUN mkdir /app && mkdir /etc/sigsci
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh
COPY app/httpd.conf /etc/apache2/httpd.conf
COPY app/default.conf /etc/apache2/sites-enabled/default.conf
COPY app/index.html /var/www/html/index.html
COPY app/login.html /var/www/html/login.html
ENTRYPOINT ["/app/start.sh"]
