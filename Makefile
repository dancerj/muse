# makefile to publish webpage

all: html/*.html

html/%.html: %.muse
	emacs -batch -l muse-config.el -eval '(muse-project-publish "Debian-study")'

publish: html/*.html html/*.css
	scp $^ alioth.debian.org:/var/lib/gforge/chroot/home/groups/tokyodebian/htdocs
