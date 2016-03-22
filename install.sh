#!/bin/bash

INSTALL_DIR=~/.site-lisp

mkdir -p ${INSTALL_DIR}

cp jontsai.emacs.elc ~/.emacs.elc

# language modes
LANGUAGE_MODES="csharp php scala yaml"
for lang in $LANGUAGE_MODES
do
    if [ $lang == 'scala' ]
    then
        cp -v scala-mode/*.el* ${INSTALL_DIR}/
    else
        MODE_FILE=${lang}-mode/${lang}-mode.elc
        cp -v ${MODE_FILE} ${INSTALL_DIR}/
    fi
done

# miscellaneous files
EL_FILES="highlight-current-line editorconfig-emacs/editorconfig"
for elfile in $EL_FILES
do
    cp -v ${elfile}.elc  ${INSTALL_DIR}/
done


