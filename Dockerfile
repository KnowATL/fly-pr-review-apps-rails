FROM ubuntu

RUN apt-get update && apt-get install -y \
    curl \
    jq && \
    rm -rf /var/cache/apt/archives /var/lib/apt/lists/*

RUN curl -L https://github.com/rbenv/ruby-build/archive/refs/tags/v20240612.tar.gz | \
    tar -xz && \
    PREFIX=/usr/local ./ruby-build-*/install.sh

RUN apt-get install -y \
    autoconf \
    patch \
    build-essential \
    rustc \
    libssl-dev \
    libyaml-dev \
    libreadline6-dev \
    zlib1g-dev \
    libgmp-dev \
    libncurses5-dev \
    libffi-dev \
    libgdbm6 \
    libgdbm-dev \
    libdb-dev \
    uuid-dev

RUN ruby-build 3.3.2 /opt/rubies/ruby-3.3.2
ENV PATH="/opt/rubies/ruby-3.3.2/bin:${PATH}"

RUN curl -L https://fly.io/install.sh | FLYCTL_INSTALL=/usr/local sh

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
