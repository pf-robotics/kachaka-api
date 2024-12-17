FROM python:3.10-slim AS kachaka-api-gen-proto

# install uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# setup environment
COPY entrypoint.sh /src/entrypoint.sh
ENTRYPOINT ["/src/entrypoint.sh"]
