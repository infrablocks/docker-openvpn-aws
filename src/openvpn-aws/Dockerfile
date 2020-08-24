FROM infrablocks/alpine-aws-s3-config:0.20.0

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories && \
    apk add --update --no-cache \
        gettext \
        openvpn \
        iptables

EXPOSE 1194

COPY docker-entrypoint.sh /etc/openvpn/docker-entrypoint.sh
COPY scripts/fetch-pki.sh /etc/openvpn/scripts/fetch-pki.sh

RUN ["chmod", "+x", "/etc/openvpn/docker-entrypoint.sh"]
RUN ["chmod", "+x", "/etc/openvpn/scripts/fetch-pki.sh"]

COPY conf/server.conf.template /etc/openvpn/server.conf.template

ENV STARTUP_SCRIPT_PATH=/etc/openvpn/docker-entrypoint.sh
ENV FETCH_SECRETS_FILES_SCRIPT_PATH=/etc/openvpn/scripts/fetch-pki.sh
