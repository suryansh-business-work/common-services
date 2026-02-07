FROM redis:latest

LABEL maintainer="suryansh-business-work"
LABEL service="redis"

EXPOSE 6379

HEALTHCHECK --interval=30s --timeout=10s --start-period=15s --retries=3 \
  CMD redis-cli ping | grep -q PONG || exit 1
