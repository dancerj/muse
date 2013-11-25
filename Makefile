# makefile to publish webpage

MUSE_FILES = $(wildcard *.muse)
HTML_FILES = $(MUSE_FILES:%.muse=html/%.html)
UPLOAD_FILES = $(HTML_FILES) $(wildcard html/*.css)
RELEASEFILES:=$(UPLOAD_FILES:%=%.release-stamp)
ALIOTH_FILEHOSTING:=alioth.debian.org

all: $(HTML_FILES)

html/%.html: %.muse
	umask 002; emacs -batch -l muse-config.el -eval '(muse-project-publish "Debian-study")'

%.release-stamp: %
	scp $< ${ALIOTH_FILEHOSTING}:/home/groups/tokyodebian/htdocs/
	touch $@

publish: $(RELEASEFILES)
	-git commit -a -m 'update with publish'
	-git push
	-ssh ${ALIOTH_FILEHOSTING} chmod g+w /home/groups/tokyodebian/htdocs/*html /home/groups/tokyodebian/htdocs/*css

preview: all
	sensible-browser "$${PWD}/html/index.html"

clean:
	-rm *~

.PHONY: all publish preview clean

.NOTPARALLEL: