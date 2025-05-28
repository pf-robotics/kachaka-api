# ================================================================
FROM python:3.10-slim AS kachaka-api-gen-proto-python

# install uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# setup environment
COPY pyproject.toml /src/pyproject.toml
COPY uv.lock /src/uv.lock
COPY tools/gen_proto/python_entrypoint.sh /src/entrypoint.sh

ENTRYPOINT ["/src/entrypoint.sh"]

# ================================================================
FROM ubuntu:22.04 AS kachaka-api-gen-proto-ros2

RUN apt-get update && \
    apt-get -y install --no-install-recommends \
        protobuf-compiler-grpc \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# setup environment
COPY ./tools/gen_proto/ros2_entrypoint.sh /src/entrypoint.sh

ENTRYPOINT ["/src/entrypoint.sh"]
