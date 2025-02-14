FROM ubuntu:22.04 AS kachaka-api-gen-proto

RUN apt-get update && \
    apt-get -y install --no-install-recommends \
        protobuf-compiler-grpc \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# setup environment
COPY entrypoint.sh /src/entrypoint.sh
ENTRYPOINT ["/src/entrypoint.sh"]
