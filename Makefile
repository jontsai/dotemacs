all: update dependencies compile install

dependencies:
	emacs --batch --load dependencies.el

update:
	git submodule update --init --recursive

compile:
	./byte-compile.sh
	cd helm && make

install:
	./install.sh
