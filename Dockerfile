FROM ubuntu

RUN apt update && apt install -y \
    curl \
    jq \
    rbenv \
    ruby-bundler && \
    rm -rf /var/cache/apt/archives /var/lib/apt/lists/*

RUN rbenv install 3.3.2
RUN curl -L https://fly.io/install.sh | FLYCTL_INSTALL=/usr/local sh

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
