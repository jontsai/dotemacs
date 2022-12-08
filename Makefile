all: update compile install

update:
	git submodule update --init --recursive

compile:
	./byte-compile.sh
	cd helm && make

install:
	./install.sh
