FROM node:10.13.0

RUN apt-get update
RUN apt-get install -y curl gnupg2 ca-certificates lsb-release apt-transport-https nginx -y

# Step 1 - Add the Package Repositories
RUN wget -qO - https://apt.signalsciences.net/release/gpgkey | apt-key add - && echo "deb https://apt.signalsciences.net/release/debian/ stretch main" |  tee /etc/apt/sources.list.d/sigsci-release.list && apt-get update

#RUN wget -qO - https://apt.signalsciences.net/release/gpgkey | apt-key add -
#RUN echo "deb https://apt.signalsciences.net/release/debian/ stretch main" > /etc/apt/sources.list.d/sigsci-release.list
#RUN apt-get update

# Step 2 - Install the Signal Sciences Agent Package
RUN apt-get -y install sigsci-agent

COPY /agent.conf /etc/sigsci/agent.conf

# Step 3 - Install the sigsci module
RUN apt-get -y install nginx-extras
RUN apt-get -y install sigsci-module-nginx

COPY /app/nginx.conf /etc/nginx/nginx.conf

RUN mkdir /app

COPY start.sh /app/start.sh

ENTRYPOINT ["/app/start.sh"]