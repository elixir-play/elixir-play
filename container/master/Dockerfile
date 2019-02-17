FROM erlang:21

ENV LANG=C.UTF-8

ARG DL_FROM=master

RUN set -xe \
  && cd /tmp \
  && wget -q https://github.com/elixir-lang/elixir/archive/${DL_FROM}.tar.gz \
  && tar -zxf ${DL_FROM}.tar.gz \
  && cd elixir-${DL_FROM} \
  && make install \
  && rm -Rf /tmp/*

CMD ["iex"]
