FROM debian:buster

RUN apt-get clean && \
    apt-get update && \
    apt-get install -yq \
    locales \
    make \
    emacs-nox \
    elpa-muse && \
    apt-get clean && \
    echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen && \
    dpkg-reconfigure -f noninteractive locales && \
    update-locale LANG=ja_JP.UTF-8 LC_ALL=ja_JP.UTF-8 && \
    locale -a