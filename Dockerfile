# syntax=docker/dockerfile:experimental
FROM rust:1.67 as release
WORKDIR /app
ENV HOME=/root
COPY . .
RUN --mount=type=cache,target=/usr/local/cargo/registry \
    --mount=type=cache,target=/app/target \
    cargo install --all-features --bins --verbose --path . \
    && find /app/target

FROM gcr.io/distroless/cc:debug
COPY --from=release /app/target/release /app/target/release 
ENV ROCKET_ADDRESS="0.0.0.0"
ENTRYPOINT ["/app/target/release/rustyrumor"]
