#!/bin/bash

wget -O caddy.tar.gz "https://github.com/caddyserver/caddy/releases/download/v2.5.1/caddy_2.5.1_linux_amd64.tar.gz"
tar zxvf caddy.tar.gz
./caddy version

wget "https://raw.githubusercontent.com/caddyserver/dist/master/config/Caddyfile"
wget "https://raw.githubusercontent.com/caddyserver/dist/master/welcome/index.html"
