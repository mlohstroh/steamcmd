FROM ubuntu:xenial

LABEL maintainer="mlohstroh@gmail.com"

RUN groupadd -r steam && \
    useradd -r -d /home/steam -g steam steam && \
    apt-get update && \
    apt-get install -yq lib32gcc1 curl

# Be the steam user
RUN su - steam
WORKDIR /home/steam
RUN curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -

ENTRYPOINT [ "./steamcmd.sh" ]