FROM ubuntu:latest

LABEL maintainer="suryansh-business-work"
LABEL service="github-custom-runner"

ARG RUNNER_VERSION=latest
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl \
    jq \
    wget \
    git \
    sudo \
    unzip \
    zip \
    apt-transport-https \
    ca-certificates \
    gnupg \
    lsb-release \
    software-properties-common \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3 \
    python3-pip \
    nodejs \
    npm \
    docker.io \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m runner && \
    echo "runner ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

WORKDIR /home/runner

RUN if [ "$RUNNER_VERSION" = "latest" ]; then \
      RUNNER_VERSION=$(curl -s https://api.github.com/repos/actions/runner/releases/latest | jq -r '.tag_name' | sed 's/v//'); \
    fi && \
    curl -o actions-runner-linux-x64.tar.gz -L "https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz" && \
    tar xzf actions-runner-linux-x64.tar.gz && \
    rm actions-runner-linux-x64.tar.gz && \
    ./bin/installdependencies.sh

COPY start.sh /home/runner/start.sh
RUN chmod +x /home/runner/start.sh

USER runner

EXPOSE 4033

ENTRYPOINT ["/home/runner/start.sh"]
