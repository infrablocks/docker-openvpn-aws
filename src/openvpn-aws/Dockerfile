FROM infrablocks/alpine-aws-s3-config:0.6.0

RUN addgroup openvpn && \
    adduser -S -G openvpn openvpn

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories && \
    apk add --update --no-cache \
        gettext \
        openvpn \
        iptables \
        openvpn-auth-pam \
        google-authenticator \
        pamtester

EXPOSE 1194

COPY docker-entrypoint.sh /openvpn/bin/docker-entrypoint.sh

ENV STARTUP_SCRIPT_PATH=/openvpn/bin/docker-entrypoint.sh
