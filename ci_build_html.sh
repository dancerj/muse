#!/bin/bash
echo "#### CI START"
date '+%Y-%m-%d %H:%M:%S%z'

apt-get update

echo "#### INSTALL AND SETUP LOCALES."
date '+%Y-%m-%d %H:%M:%S%z'
apt-get install -y locales
echo "locale -a"
locale -a

echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen
dpkg-reconfigure -f noninteractive locales
update-locale LANG=ja_JP.UTF-8 LC_ALL=ja_JP.UTF-8

echo "locale -a"
locale -a

echo "#### INSTALL BUILD DEPENDENCY PACKAGES."
date '+%Y-%m-%d %H:%M:%S%z'
apt-get install -y make emacs-nox elpa-muse

echo "#### START BUILD"
date '+%Y-%m-%d %H:%M:%S%z'
make

echo "#### FINISH"
date '+%Y-%m-%d %H:%M:%S%z'
