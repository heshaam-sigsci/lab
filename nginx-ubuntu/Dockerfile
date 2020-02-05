FROM ubuntu:bionic

RUN apt-get update
RUN apt-get install -y apt-transport-https wget gnupg2 nginx

# Step 1 - Add the Package Repositories
RUN wget -qO - https://apt.signalsciences.net/release/gpgkey | apt-key add - &&  echo "deb https://apt.signalsciences.net/release/ubuntu/ bionic main" |  tee /etc/apt/sources.list.d/sigsci-release.list && apt-get update

# Alternative for Step 1
# RUN wget -qO - https://apt.signalsciences.net/release/gpgkey | apt-key add -
# RUN echo "deb https://apt.signalsciences.net/release/ubuntu/ bionic main" > /etc/apt/sources.list.d/sigsci-release.list
# RUN apt-get update

# Step 2 - Install the Signal Sciences Agent Package and Copy Agent Config
RUN apt-get install -y sigsci-agent

RUN mkdir /app && mkdir /etc/sigsci
COPY /agent.conf /etc/sigsci/agent.conf

# Step 3 - Install the sigsci module and Copy NGINX Config
RUN apt-get install -y nginx-extras && service nginx restart
RUN apt-get install -y sigsci-module-nginx

COPY /app/nginx.conf /etc/nginx/nginx.conf

COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

ENTRYPOINT ["/app/start.sh"]
