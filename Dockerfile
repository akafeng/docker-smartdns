FROM alpine:3.12

LABEL maintainer="akafeng <i@sjy.im>"

ARG SMARTDNS_VERSION="Release33"
ARG SMARTDNS_URL="https://github.com/pymumu/smartdns/releases/download/${SMARTDNS_VERSION}/smartdns-x86_64"
ARG SMARTDNS_CONF="https://raw.githubusercontent.com/pymumu/smartdns/${SMARTDNS_VERSION}/etc/smartdns/smartdns.conf"

RUN set -eux \
  && apk add --no-cache \
    tzdata \
  \
  && wget -O /usr/local/bin/smartdns ${SMARTDNS_URL} \
  && chmod +x /usr/local/bin/smartdns \
  \
  && mkdir /etc/smartdns/ \
  && wget ${SMARTDNS_CONF} \
  && mv smartdns.conf /etc/smartdns/smartdns.conf \
  && ln -s /dev/stderr /var/log/smartdns.log

EXPOSE 53/udp

CMD ["smartdns", "-f", "-c", "/etc/smartdns/smartdns.conf", "-p", "/tmp/smartdns.pid"]
