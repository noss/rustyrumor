# syntax=docker/dockerfile:experimental
FROM rust:1.67 as release
WORKDIR /app
ENV HOME=/root
COPY . .
RUN --mount=type=cache,target=/usr/local/cargo/registry \
    cargo install --all-features --bins --verbose --path .

FROM gcr.io/distroless/cc
COPY --from=release /app/target/release/rustyrumor .
ENV ROCKET_ADDRESS="0.0.0.0"
ENTRYPOINT ["./rustyrumor"]
