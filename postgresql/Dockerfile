FROM postgres:latest

LABEL maintainer="suryansh-business-work"
LABEL service="postgresql"

ENV POSTGRES_USER=admin
ENV POSTGRES_PASSWORD=admin
ENV POSTGRES_DB=common_services

EXPOSE 5432

HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 \
  CMD pg_isready -U admin -d common_services || exit 1
