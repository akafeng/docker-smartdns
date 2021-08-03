FROM alpine:3.12

LABEL \
    org.opencontainers.image.title="smartdns" \
    org.opencontainers.image.authors="akafeng <i@sjy.im>" \
    org.opencontainers.image.source="https://github.com/akafeng/docker-smartdns"

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
  && wget -O /etc/smartdns/config.conf ${SMARTDNS_CONF} \
  && ln -s /dev/stderr /var/log/smartdns.log

EXPOSE 53/udp

ENTRYPOINT ["/usr/local/bin/smartdns"]
CMD ["-f", "-c", "/etc/smartdns/config.conf", "-p", "/tmp/smartdns.pid"]
