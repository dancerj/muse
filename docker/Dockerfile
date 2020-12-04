#
# Dockerfile for tokyodebian-team.pages.debian.net on gitlab-runner.
#
FROM debian:10

RUN apt-get update

# for tokyodebian-team.pages.debian.net
RUN apt-get install -y locales make emacs-nox elpa-muse
RUN apt-get clean
RUN echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen
RUN locale-gen
