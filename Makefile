# makefile to publish webpage

MUSE_FILES = $(wildcard *.muse)
HTML_FILES = $(MUSE_FILES:%.muse=html/%.html)
UPLOAD_FILES = $(HTML_FILES) html/*.css
RELEASEFILES:=$(UPLOAD_FILES:%=%.release-stamp)

all: $(HTML_FILES)

html/%.html: %.muse
	umask 002; emacs -batch -l muse-config.el -eval '(muse-project-publish "Debian-study")'

%.release-stamp: %
	touch $@
	scp -p $< alioth.debian.org:/var/lib/gforge/chroot/home/groups/tokyodebian/htdocs/

publish: $(RELEASE_FILES)
	-git-commit -a -m 'update with publish' && git-push
	ssh alioth.debian.org chmod g+w /var/lib/gforge/chroot/home/groups/tokyodebian/htdocs/*html  /var/lib/gforge/chroot/home/groups/tokyodebian/htdocs/*css

preview: all
	mozilla -remote "openurl($${PWD}/html/index.html)"

clean:
	-rm *~
	touch $(UPLOAD_FILES)

.PHONY: all publish preview clean
