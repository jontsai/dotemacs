all: update dependencies compile install

update:
	git submodule update --init --recursive

dependencies:
	emacs --batch --load dependencies.el

compile:
	./byte-compile.sh
	cd helm && make

install:
	./install.sh
