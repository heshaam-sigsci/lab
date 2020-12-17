FROM openresty/openresty:xenial

# initial setup
RUN apt-get update
RUN apt-get install -y apt-transport-https wget sed curl gnupg

# add the signal sciences repo to our apt sources
RUN wget -qO - https://apt.signalsciences.net/release/gpgkey | apt-key add -
RUN echo "deb https://apt.signalsciences.net/release/ubuntu/ xenial main" > /etc/apt/sources.list.d/sigsci-release.list
RUN apt-get update
#RUN wget -qO - https://apt.signalsciences.net/nginx/gpg.key | apt-key add -
#RUN echo "deb https://apt.signalsciences.net/nginx/distro xenial main" > /etc/apt/sources.list.d/sigsci-nginx.list
RUN apt-get update
#RUN apt-get install nginx-module-lua

# install and configure the sigsci agent
RUN apt-get -y install sigsci-agent
# install the sigsci module
RUN apt-get -y install sigsci-module-nginx

RUN  mkdir /app && mkdir /etc/sigsci
COPY app/nginx.conf usr/local/openresty/nginx/conf/nginx.conf
COPY app/default.conf /etc/nginx/conf.d/default.conf
COPY app/index.html /usr/local/openresty/nginx/html/index.html
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

ENTRYPOINT ["/app/start.sh"]
