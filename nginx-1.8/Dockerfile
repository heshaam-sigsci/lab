FROM nginx:1.8

RUN apt-get update
RUN apt-get install -y apt-transport-https wget curl vim

# Step 1 - Add the Package Repositories
RUN wget -qO - https://apt.signalsciences.net/release/gpgkey | apt-key add - &&  echo "deb https://apt.signalsciences.net/release/debian/ jessie main" |  tee /etc/apt/sources.list.d/sigsci-release.list && apt-get update

# Step 2 - Install the Signal Sciences Agent Package and Copy Agent Config
RUN apt-get install -y sigsci-agent

RUN mkdir /app && mkdir /etc/sigsci
COPY /agent.conf /etc/sigsci/agent.conf

RUN wget -qO - https://apt.signalsciences.net/nginx/gpg.key | apt-key add - &&  echo "deb https://apt.signalsciences.net/nginx/stable jessie main" |  tee /etc/apt/sources.list.d/sigsci-nginx.list && apt-get update

#Fix permissions issue with removing NGINX package
RUN printf '#!/bin/sh\nexit 0' > /usr/sbin/policy-rc.d

#Remove existing NGINX package and replace with SigSci NGINX build
RUN apt-get remove -y nginx nginx-common nginx-full
RUN apt-get install -y nginx

# Step 3 - Install the sigsci module and Copy NGINX Config
RUN apt-get install -y sigsci-module-nginx

COPY /app/nginx.conf /etc/nginx/nginx.conf

COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

ENTRYPOINT ["/app/start.sh"]