#!/bin/bash

INSTALL_DIR=~/.site-lisp

mkdir -p ${INSTALL_DIR}

# Install primary dotemacs file
cp -v dotemacs.emacs.elc ~/.emacs.elc

# Install Language Modes
LANGUAGE_MODES="apex csharp coffee lua php puppet scala yaml"
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


# Miscellaneous .elc files
ELC_FILES="highlight-current-line editorconfig/editorconfig editorconfig/editorconfig-core editorconfig/editorconfig-core-handle editorconfig/editorconfig-fnmatch prettier-js/prettier-js py-isort/py-isort"
for elcfile in $ELC_FILES
do
    cp -v ${elcfile}.elc ${INSTALL_DIR}/
done
