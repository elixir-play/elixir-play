ARG ELIXIR_VERSION=1.7.4

FROM elixir:$ELIXIR_VERSION-alpine

WORKDIR /app

COPY . /app/

RUN mix compile
