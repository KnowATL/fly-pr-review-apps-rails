FROM ruby:3.3.2-slim-bullseye

RUN apt-get update && apt-get install -y \
    curl \
    build-essential \
    jq && \
    rm -rf /var/cache/apt/archives /var/lib/apt/lists/*

RUN curl -L https://fly.io/install.sh | FLYCTL_INSTALL=/usr/local sh

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
