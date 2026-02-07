FROM mongo:latest

LABEL maintainer="suryansh-business-work"
LABEL service="mongodb"

ENV MONGO_INITDB_ROOT_USERNAME=admin
ENV MONGO_INITDB_ROOT_PASSWORD=admin

EXPOSE 27017

HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 \
  CMD mongosh --eval "db.adminCommand('ping')" || exit 1
