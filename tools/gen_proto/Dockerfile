FROM python:3.10-slim AS kachaka-api-gen-proto

# install uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# setup environment
WORKDIR /src

COPY pyproject.toml /src/pyproject.toml
COPY uv.lock /src/uv.lock
COPY .python-version /src/.python-version

RUN uv sync

COPY entrypoint.sh /src/entrypoint.sh
ENTRYPOINT ["/src/entrypoint.sh"]
