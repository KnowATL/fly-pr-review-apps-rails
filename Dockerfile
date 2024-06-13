FROM ubuntu

RUN apt update && apt install -y \
    curl \
    jq \
    ruby-bundler && \
    rm -rf /var/cache/apt/archives /var/lib/apt/lists/*

RUN curl -L https://fly.io/install.sh | FLYCTL_INSTALL=/usr/local sh

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
