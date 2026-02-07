FROM prom/prometheus:latest

LABEL maintainer="suryansh-business-work"
LABEL service="prometheus"

COPY prometheus.yml /etc/prometheus/prometheus.yml

EXPOSE 9090

HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:9090/-/healthy || exit 1
