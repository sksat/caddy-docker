#!/bin/bash

CADDY_VERSION="2.5.1"

ARCH="$(uname -m)"
case "$ARCH" in
  x86_64) CADDY_ARCH="amd64" ;;
  aarch64) CADDY_ARCH="arm64" ;;
  *) CADDY_ARCH="$ARCH" ;;
esac

echo "downloading caddy v${CADDY_VERSION} for ${CADDY_ARCH}"

wget -O caddy.tar.gz "https://github.com/caddyserver/caddy/releases/download/v${CADDY_VERSION}/caddy_${CADDY_VERSION}_linux_${CADDY_ARCH}.tar.gz"
tar zxvf caddy.tar.gz

wget "https://raw.githubusercontent.com/caddyserver/dist/master/config/Caddyfile"
wget "https://raw.githubusercontent.com/caddyserver/dist/master/welcome/index.html"
