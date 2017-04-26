FROM debian:latest

RUN apt-get clean all && \
    apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install  build-essential \
                        gawk \
                        pkg-config \
                        gettext \
                        automake \
                        autogen \
                        texinfo \
                        autoconf \
                        libtool \
                        bison \
                        flex \
                        zlib1g-dev \
                        libgmp3-dev \
                        libmpfr-dev \
                        libmpc-dev \
                        git \
                        sudo \
                        module-init-tools \
                        vim && \
    apt-get -y purge manpages \
                     xauth \
                     debconf-i18n && \
    apt-get -y autoremove && \
    apt-get -y autoclean && \
    apt-get clean all


VOLUME /opt/rt-n56u


