FROM tusproject/tusd:latest

LABEL maintainer="suryansh-business-work"
LABEL service="tusd"

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=10s --start-period=15s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:8080/metrics || exit 1
