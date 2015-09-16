#!/bin/bash

INSTALL_DIR=~/.site-lisp

mkdir -p ${INSTALL_DIR}

cp jontsai.emacs.elc ~/.emacs.elc

# language modes
LANGUAGE_MODES="csharp php"
for lang in $LANGUAGE_MODES
do
    cp -v ${lang}-mode/${lang}-mode.elc ${INSTALL_DIR}/
done

# miscellaneous files
EL_FILES="highlight-current-line editorconfig-emacs/editorconfig"
for elfile in $EL_FILES
do
    cp -v ${elfile}.elc  ${INSTALL_DIR}/
done


