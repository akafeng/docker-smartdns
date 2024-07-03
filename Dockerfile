FROM debian:bookworm-slim

ARG SMARTDNS_VERSION="Release46"
ARG SMARTDNS_URL="https://github.com/pymumu/smartdns/releases/download/${SMARTDNS_VERSION}/"
ARG SMARTDNS_CONF="https://github.com/pymumu/smartdns/raw/${SMARTDNS_VERSION}/etc/smartdns/smartdns.conf"

RUN set -eux \
    && apt-get update -qyy \
    && apt-get install -qyy --no-install-recommends --no-install-suggests \
        ca-certificates \
        wget \
        libcap2-bin \
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
        esac \
    \
    && wget -O /usr/local/bin/smartdns "${SMARTDNS_URL}${SMARTDNS_FILENAME}" \
    && chmod +x /usr/local/bin/smartdns \
    && setcap CAP_NET_BIND_SERVICE,CAP_NET_RAW=+eip /usr/local/bin/smartdns \
    \
    && mkdir /etc/smartdns/ \
    && wget -O /etc/smartdns/smartdns.conf "${SMARTDNS_CONF}"

EXPOSE 53/udp

ENTRYPOINT ["/usr/local/bin/smartdns"]
CMD ["-f", "-c", "/etc/smartdns/smartdns.conf", "-p", "/tmp/smartdns.pid"]