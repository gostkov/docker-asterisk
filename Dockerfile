FROM centos:7

LABEL lua_version="5.1"
LABEL asterisk_major_version="16"
LABEL maintainer="Evgeniy Gostkov <gostkov.evg@gmail.com>"

RUN yum update -y && yum -y install epel-release && yum install -y nscd wget

# RUN wget https://ast.tucny.com/repo/tucny-asterisk.repo -O tucny-asterisk.repo && mv tucny-asterisk.repo /etc/yum.repos.d/ && rpm --import https://ast.tucny.com/repo/RPM-GPG-KEY-dtucny
COPY ./tucny-asterisk.repo /etc/yum.repos.d/
RUN rpm --import https://ast.tucny.com/repo/RPM-GPG-KEY-dtucny

RUN yum install -y asterisk-pjsip asterisk asterisk-sqlite asterisk-voicemail-plain asterisk-sounds-core-en asterisk-moh-opsound-wav asterisk-lua asterisk-curl asterisk-ael asterisk-sounds-core-en-wav
RUN yum clean all

EXPOSE 5060/udp 5060/tcp

CMD ["asterisk", "-fvvv"]
