#!/bin/bash

# TODO: not quite working to compile all *.el files
# for EL in `find . -type f -name "*.el"`
# do
#     emacs -batch -f batch-byte-compile ./ $EL
# done

# workaround: provide list of Emacs modules to compile

EMACS_MODULES="apex-mode coffee-mode csharp-mode editorconfig lua-mode php-mode scala-mode2 yaml-mode"

for module in $EMACS_MODULES
do
    echo 'Compiling Emacs module: ' $module
    pushd $module && emacs -batch -f batch-byte-compile ./ $module.el
    popd
done

FILES="highlight-current-line jontsai.emacs editorconfig/editorconfig-core editorconfig/editorconfig-core-handle editorconfig/editorconfig-fnmatch editorconfig/editorconfig py-isort/py-isort"
for file in $FILES
do
    echo 'Compiling Emacs module: ' $file
    LOAD_PATH="-L ./ -L editorconfig -L py-isort"
    emacs -batch ${LOAD_PATH} -f batch-byte-compile ./ $file.el
done
