FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive
RUN apt update -y \
    && apt install -y xvfb x11vnc

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
