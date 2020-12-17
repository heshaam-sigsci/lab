FROM openresty/openresty:alpine as openresty-base
# if you want to use this without docker-compose
# ADD nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
# CMD ["nginx", "-g", "daemon off;"]

FROM openresty-base as sigsci
ARG SIGSCI_VERSION="nginx_latest"
COPY nginx_start.sh /tmp/nginx_start.sh

WORKDIR /tmp
# hadolint ignore=DL3018
RUN apk add --no-cache --virtual .runtime-deps \
            curl \
            ca-certificates \
    && curl -fSL https://dl.signalsciences.net/sigsci-module-nginx/sigsci-module-${SIGSCI_VERSION}.tar.gz -o /tmp/sigsci-module-${SIGSCI_VERSION}.tar.gz \
    && mkdir -p /opt/sigsci/nginx/ \
    && tar xf /tmp/sigsci-module-nginx_latest.tar.gz -C /tmp \
    && mv /tmp/sigsci-module-nginx/* /opt/sigsci/nginx/ \
    && rm -rf /tmp/sigsci-module-${SIGSCI_VERSION}.tar.gz \
    && apk del .runtime-deps
# RUN chmod +x /tmp/nginx_start.sh
CMD [ "/tmp/nginx_start.sh" ]