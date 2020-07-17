FROM clux/muslrust:nightly as builder

WORKDIR /app

RUN apt-get update  && \
  apt-get install -y --no-install-recommends \
    openssh-client \
    rsync \
    socat && \
  git clone https://github.com/sgeisler/cargo-remote && \
  cargo install --path cargo-remote --target x86_64-unknown-linux-musl

ENTRYPOINT ["/root/.cargo/bin/cargo-remote"]
