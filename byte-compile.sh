#!/bin/bash

# TODO: not quite working to compile all *.el files
# for EL in `find . -type f -name "*.el"`
# do
#     emacs -batch -f batch-byte-compile ./ $EL
# done

# workaround: provide list of Emacs modules to compile

EMACS_MODULES=`cat modules.txt`

for module in $EMACS_MODULES
do
    echo 'Compiling Emacs module: ' $module
    pushd $module && emacs -batch -f batch-byte-compile ./ $module.el
    popd
done

FILES=`cat files.txt custom_elc_files.txt | grep -v "^#.*" --color=never`
for file in $FILES
do
    echo 'Compiling Emacs module: ' $file
    LOAD_PATH="-L ./ -L blacken -L editorconfig -L prettier-js -L py-isort"
    emacs -batch ${LOAD_PATH} -f batch-byte-compile ./ $file.el
done
