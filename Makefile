# makefile to publish webpage

all: html/*.html

html/%.html: %.muse
	emacs -batch -l muse-config.el -eval '(muse-project-publish "Debian-study")'

publish: html/*.html html/*.css
	cvs ci -m 'update with publish'
	#-fusermount -u ../aliothweb 
	sshfs -o nonempty alioth.debian.org:/var/lib/gforge/chroot/home/groups/tokyodebian/htdocs ../aliothweb
	cp $^ ../aliothweb/

preview: all
	mozilla -remote "openurl($${PWD}/html/index.html)"

clean:
	-rm *~


.PHONY: all publish preview clean


