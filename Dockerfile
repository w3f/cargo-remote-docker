FROM clux/muslrust:nightly as builder

WORKDIR /app

RUN git clone https://github.com/sgeisler/cargo-remote && \
  cargo install --path cargo-remote --target x86_64-unknown-linux-musl

ENTRYPOINT ["/root/.cargo/bin/cargo-remote"]
