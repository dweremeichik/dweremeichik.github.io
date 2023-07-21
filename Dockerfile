FROM hexpm/elixir:1.15.2-erlang-26.0.2-debian-bookworm-20230612-slim as build

RUN apt-get -y update
RUN apt-get -y install git inotify-tools curl

RUN apt-get clean

RUN mix local.hex --force
