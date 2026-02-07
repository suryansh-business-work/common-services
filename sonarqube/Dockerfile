FROM sonarqube:latest

LABEL maintainer="suryansh-business-work"
LABEL service="sonarqube"

EXPOSE 9000

HEALTHCHECK --interval=30s --timeout=10s --start-period=120s --retries=5 \
  CMD curl -f http://localhost:9000/api/system/status || exit 1
