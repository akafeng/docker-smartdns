FROM debian:bullseye-slim AS builder

ARG SMARTDNS_VERSION="Release39"
ARG SMARTDNS_URL="https://github.com/pymumu/smartdns/releases/download/${SMARTDNS_VERSION}/"
ARG SMARTDNS_CONF="https://raw.githubusercontent.com/pymumu/smartdns/${SMARTDNS_VERSION}/etc/smartdns/smartdns.conf"

RUN set -eux \
    && apt-get update -qyy \
    && apt-get install -qyy --no-install-recommends --no-install-suggests \
        ca-certificates \
        wget \
    && rm -rf /var/lib/apt/lists/* /var/log/* \
    \
    && ARCH=`uname -m` \
    && case "$ARCH" in \
            "x86_64") \
                SMARTDNS_FILENAME="smartdns-x86_64" \
                ;; \
            "aarch64") \
                SMARTDNS_FILENAME="smartdns-aarch64" \
                ;; \
            "armv7l") \
                SMARTDNS_FILENAME="smartdns-arm" \
                ;; \
        esac \
    \
    && wget -O /usr/local/bin/smartdns "${SMARTDNS_URL}${SMARTDNS_FILENAME}" \
    && chmod +x /usr/local/bin/smartdns \
    \
    && mkdir /etc/smartdns/ \
    && wget -O /etc/smartdns/config.conf "${SMARTDNS_CONF}" \
    && ln -s /dev/stderr /var/log/smartdns.log

EXPOSE 53/udp

ENTRYPOINT ["/usr/local/bin/smartdns"]
CMD ["-f", "-c", "/etc/smartdns/config.conf", "-p", "/tmp/smartdns.pid"]