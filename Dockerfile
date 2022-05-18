FROM gcr.io/distroless/base
LABEL maintainer "sksat <sksat@sksat.net>"

FROM debian:stable-slim as tmp
WORKDIR /prepare
RUN set -eu; \
  apt-get update -y; \
  apt-get install -y wget
COPY download.sh .
RUN bash download.sh
RUN ./caddy version

FROM gcr.io/distroless/base
# docs: https://caddyserver.com/docs/conventions#file-locations
ENV XDG_CONFIG_HOME /config
ENV XDG_DATA_HOME /data

COPY --from=tmp /prepare/caddy /usr/bin/
COPY --from=tmp /prepare/LICENSE /LICENSE-caddy
COPY --from=tmp /prepare/Caddyfile /etc/caddy/
COPY --from=tmp /prepare/index.html /usr/share/caddy/

WORKDIR /app
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile"]
