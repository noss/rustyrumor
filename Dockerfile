FROM rust:1.67 as release
WORKDIR /app
COPY . .
RUN cargo build --release

FROM gcr.io/distroless/cc
COPY --from=release  /rustyrumor
ENTRYPOINT ["/rustyrumor"]
