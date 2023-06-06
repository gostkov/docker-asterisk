FROM ubuntu:22.04

LABEL lua_version="5.2"
LABEL asterisk_major_version="18"
LABEL maintainer="Evgeniy Gostkov <gostkov.evg@gmail.com>"
ENV DEBIAN_FRONTEND=noninteractive 
ENV BIND_PORT=5060

RUN apt update -y && apt upgrade -y && apt install -y sngrep vim lua5.2 lua-sec lua-socket lua-posix lua-md5 lua-json lua-filesystem lua-dbi-mysql lua-iconv lua-redis asterisk asterisk-config asterisk-core-sounds-en asterisk-core-sounds-en-wav asterisk-core-sounds-ru asterisk-core-sounds-ru-wav asterisk-doc asterisk-modules asterisk-moh-opsound-wav asterisk-mp3 sox wget git bzip2 mlocate htop tcpdump mc

RUN apt-get clean

EXPOSE ${BIND_PORT}/udp ${BIND_PORT}/tcp

CMD ["asterisk", "-fvvv"]
