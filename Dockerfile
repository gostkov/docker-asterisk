FROM centos:7

LABEL lua_version="5.1"
LABEL asterisk_major_version="18"
LABEL maintainer="Evgeniy Gostkov <gostkov.evg@gmail.com>"

ENV BIND_PORT=5060

RUN yum update -y && yum -y install epel-release && yum install -y nscd wget lua lua-fifo lua-bitop lua-http lua-lpeg lua-luaossl lua-sec lua-socket

RUN wget https://ast.tucny.com/repo/tucny-asterisk.repo -O tucny-asterisk.repo && mv tucny-asterisk.repo /etc/yum.repos.d/ && rpm --import https://ast.tucny.com/repo/RPM-GPG-KEY-dtucny
COPY ./tucny-asterisk.repo /etc/yum.repos.d/
RUN rpm --import https://ast.tucny.com/repo/RPM-GPG-KEY-dtucny

RUN yum install -y asterisk-pjsip asterisk asterisk-odbc asterisk-fax asterisk-moh-opsound-alaw asterisk-sqlite asterisk-voicemail-plain asterisk-sounds-core-en asterisk-moh-opsound-wav asterisk-lua asterisk-curl asterisk-ael asterisk-sounds-core-en-wav asterisk-sounds-core-ru asterisk-sounds-core-ru-wav asterisk-sounds-core-ru-alaw asterisk-hep

RUN yum clean all

EXPOSE ${BIND_PORT}/udp ${BIND_PORT}/tcp

CMD ["asterisk", "-fvvv"]
