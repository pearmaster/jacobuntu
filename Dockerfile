FROM ubuntu:18.04

LABEL maintainer="docker@jacobbrunson.com"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=US/Mountain
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
        asciidoc \
        autoconf \
        autogen \
        automake \
        build-essential \
        chrpath \
        cmake \
        coreutils \
        curl \
        cvs \
        desktop-file-utils \
        diffstat \
        docbook-utils \
        g++ \
        gawk \
        gcc \
        gdb \
        gdebi-core \
        git-core \
        help2man \
        joe \
        lib32ncurses5 \
        lib32z1 \
        libboost-all-dev \
        libbz2-1.0 \
        libbz2-dev \
        libcurl4-openssl-dev \
        libgl1-mesa-dev \
        libglu1-mesa-dev \
        liblua5.2-dev \
        libmosquitto-dev \
        libosip2-dev \
        libpam-dev \
        libsdl1.2-dev \
        libsndfile1-dev \
        libsqlite3-dev \
        libssl-dev \
        libtool \
        libupnp-dev \
        libxcb-xinerama0-dev \
        lzop \
        make \
        mercurial \
        mosquitto \
        portaudio19-dev \
        python3.7 \
        python3-pip \
        python3-setuptools \
        python-pysqlite2 \
        qml-module-qtgraphicaleffects \
        qml-module-qtmultimedia \
        qml-module-qtquick-controls \
        qml-module-qtquick-dialogs \
        qml-module-qtquick-extras \
        qml-module-qtquick-layouts \
        qtbase5-dev \
        qtdeclarative5-dev \
        qt5-default \
        qt5-qmake \
        qtdeclarative5-dev \
        qtdeclarative5-qtquick2-plugin \
        qttools5-dev-tools \
        sed \
        subversion \
        texi2html \
        texinfo \
        unzip \
        wget \
        xterm \
    && rm -rf /var/log/apt/lists/*
    
RUN chmod a+x /root
RUN if [ ! -d /root/.cache/pip/ ]; then mkdir -p /root/.cache/pip/ ; fi
RUN chmod a+x /root/.cache
RUN chmod 777 /root/.cache/pip/
RUN if [ ! -d /root/.local ]; then mkdir -p /root/.local ; fi
RUN chmod a+rwx /root/.local

RUN adduser --disabled-password --gecos '' --uid 131 user131
RUN adduser --disabled-password --gecos '' --uid 1000 user1000
RUN adduser --disabled-password --gecos '' --uid 1001 user1001

VOLUME /work
