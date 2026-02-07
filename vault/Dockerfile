FROM hashicorp/vault:latest

LABEL maintainer="suryansh-business-work"
LABEL service="vault"

ENV VAULT_DEV_ROOT_TOKEN_ID=root
ENV VAULT_DEV_LISTEN_ADDRESS=0.0.0.0:8200
ENV VAULT_ADDR=http://0.0.0.0:8200

EXPOSE 8200

HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 \
  CMD vault status || exit 1
