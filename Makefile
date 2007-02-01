# makefile to publish webpage

MUSE_FILES = $(wildcard *.muse)
HTML_FILES = $(MUSE_FILES:%.muse=html/%.html)

all: $(HTML_FILES)

html/%.html: %.muse
	umask 002; emacs -batch -l muse-config.el -eval '(muse-project-publish "Debian-study")'

publish: $(HTML_FILES) html/*.css
	cvs ci -m 'update with publish'
	-fusermount -u ../aliothweb 
	[ ! -f ../aliothweb/mountpoint ] || sshfs -o nonempty,umask=002 alioth.debian.org:/var/lib/gforge/chroot/home/groups/tokyodebian/htdocs ../aliothweb
	[ ! -f ../aliothweb/mountpoint ]
	umask 002; cp $^ ../aliothweb/

preview: all
	mozilla -remote "openurl($${PWD}/html/index.html)"

clean:
	-rm *~


.PHONY: all publish preview clean
