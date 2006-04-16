# makefile to publish webpage

all: html/*.html

html/%.html: %.muse
	emacs -batch -l muse-config.el -eval '(muse-project-publish "Debian-study")'

publish: html/*.html html/*.css
	cvs ci -m 'update with publish'
	scp $^ alioth.debian.org:/var/lib/gforge/chroot/home/groups/tokyodebian/htdocs

preview: all
	mozilla -remote "openurl($${PWD}/html/index.html)"

.PHONY: all publish preview


