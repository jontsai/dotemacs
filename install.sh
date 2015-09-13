#!/bin/bash

INSTALL_DIR=~/.site-lisp

mkdir -p ${INSTALL_DIR}

cp highlight-current-line.elc ${INSTALL_DIR}/
cp jontsai.emacs.elc ~/.emacs.elc

# language modes
LANGUAGE_MODES="csharp php"
for lang in $LANGUAGE_MODES
do
    cmd="cp ${lang}-mode/${lang}-mode.elc ${INSTALL_DIR}/"
    echo $cmd
    $cmd
done

