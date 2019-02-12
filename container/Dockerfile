ARG ELIXIR_VERSION=1.8.1

FROM elixir:$ELIXIR_VERSION

RUN useradd -m -d /app sandbox

USER sandbox

WORKDIR /app

COPY . /app

RUN mix compile
