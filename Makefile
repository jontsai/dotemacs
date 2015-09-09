all: update compile install

update:
	git submodule update --init

compile:
	./byte-compile.sh

install:
	./install.sh
