#!/bin/bash

CADDY_VERSION="2.5.1"
CADDY_ARCH="amd64"

wget -O caddy.tar.gz "https://github.com/caddyserver/caddy/releases/download/v${CADDY_VERSION}/caddy_${CADDY_VERSION}_linux_${CADDY_ARCH}.tar.gz"
tar zxvf caddy.tar.gz
./caddy version

wget "https://raw.githubusercontent.com/caddyserver/dist/master/config/Caddyfile"
wget "https://raw.githubusercontent.com/caddyserver/dist/master/welcome/index.html"
