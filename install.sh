#!/bin/bash

INSTALL_DIR=~/.site-lisp

mkdir -p ${INSTALL_DIR}

cp jontsai.emacs.elc ~/.emacs.elc

# language modes
LANGUAGE_MODES="apex csharp coffee php scala yaml"
for lang in $LANGUAGE_MODES
do
    if [ $lang == 'scala' ]
    then
        cp -v scala-mode2/*.el* ${INSTALL_DIR}/
    else
        MODE_FILE=${lang}-mode/${lang}-mode.elc
        cp -v ${MODE_FILE} ${INSTALL_DIR}/
    fi
done

# miscellaneous .elc files
ELC_FILES="highlight-current-line editorconfig/editorconfig editorconfig/editorconfig-core editorconfig/editorconfig-core-handle editorconfig/editorconfig-fnmatch"
for elcfile in $ELC_FILES
do
    cp -v ${elcfile}.elc  ${INSTALL_DIR}/
done
