FROM grafana/loki:latest

LABEL maintainer="suryansh-business-work"
LABEL service="loki"

COPY loki-config.yml /etc/loki/local-config.yaml

EXPOSE 3100

HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:3100/ready || exit 1
