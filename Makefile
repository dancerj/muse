# makefile to publish webpage

MUSE_FILES = $(wildcard *.muse)
HTML_FILES = $(MUSE_FILES:%.muse=html/%.html)

all: $(HTML_FILES)

html/%.html: %.muse
	umask 002; emacs -batch -l muse-config.el -eval '(muse-project-publish "Debian-study")'

publish: $(HTML_FILES) html/*.css
	-git-commit -a -m 'update with publish' && git-push
	-scp $^ alioth.debian.org:/var/lib/gforge/chroot/home/groups/tokyodebian/htdocs
	ssh alioth.debian.org chmod g+w /var/lib/gforge/chroot/home/groups/tokyodebian/htdocs/*html

preview: all
	mozilla -remote "openurl($${PWD}/html/index.html)"

clean:
	-rm *~

.PHONY: all publish preview clean
