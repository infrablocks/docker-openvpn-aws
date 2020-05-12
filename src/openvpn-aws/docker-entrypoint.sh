#!/bin/bash

[ "$TRACE" = "yes" ] && set -x
set -e

# Route IPs through the VPN
iptables -t nat -A POSTROUTING -s "${OPENVPN_REMOTE_CIDR}" -o eth0 -j MASQUERADE

# Create tunnel device
mkdir -p /dev/net
if [ ! -c /dev/net/tun ]; then
    mknod /dev/net/tun c 10 200
fi

echo "Rendering openvpn server config file."
envsubst \
  < /etc/openvpn/server.conf.template \
  > /etc/openvpn/server.conf

[ "$DEBUG" = "yes" ] && cat /etc/openvpn/server.conf

echo "Running openvpn"
cd /etc/openvpn
exec openvpn \
    --config /etc/openvpn/server.conf
