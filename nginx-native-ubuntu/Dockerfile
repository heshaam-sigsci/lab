FROM ubuntu:bionic

RUN apt-get update
RUN apt-get install -y curl gnupg2 ca-certificates lsb-release apt-transport-https wget

COPY /app/nginx.list /etc/apt/sources.list.d
#RUN echo "deb http://nginx.org/packages/debian `lsb_release -cs` nginx" | tee /etc/apt/sources.list.d/nginx.list

#RUN wget -qO - https://nginx.org/keys/nginx_signing.key | apt-key add -
RUN curl -fsSL https://nginx.org/keys/nginx_signing.key | apt-key add -

RUN apt-get update
RUN apt-get install nginx=1.16.*

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

# Step 3 - Install the sigsci module
RUN apt-get install -y nginx-module-sigsci-nxo=1.16.1*

COPY /app/nginx.conf /etc/nginx/nginx.conf

COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

ENTRYPOINT ["/app/start.sh"]
