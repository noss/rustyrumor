# syntax=docker/dockerfile:experimental
FROM rust:1.67 as release
WORKDIR /app
ENV HOME=/root
COPY . .
RUN --mount=type=cache,target=/usr/local/cargo/registry \
    --mount=type=cache,target=/root/app/target \
    cargo build --release

FROM gcr.io/distroless/cc
COPY --from=release /app/target/release/rustyrumor /rustyrumor
ENTRYPOINT ["/rustyrumor"]
