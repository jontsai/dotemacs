#!/bin/bash

INSTALL_DIR=~/.site-lisp
CUSTOM_DIR=~/.emacs.d/custom

mkdir -p ${INSTALL_DIR}
mkdir -p ${CUSTOM_DIR}

# Install primary dotemacs file
cp -v dotemacs.emacs.elc ~/.emacs.elc

# Install Language Modes
LANGUAGE_MODES=`cat language_modes.txt`
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

ELC_FILES=`cat elc_files.txt`
for elcfile in $ELC_FILES
do
    # if [ "${elcfile: -4}" == ".elc" ]
    if [[ ${elcfile} == *.elc ]]
    then
        # glob pattern or already has .elc extension, do not append .elc extension
        f=${elcfile}
    else
        f="${elcfile}.elc"
    fi
    cp -v $f ${INSTALL_DIR}/
done

CUSTOM_ELC_FILES=`cat custom_elc_files.txt`
for elcfile in $CUSTOM_ELC_FILES
do
    if [[ ${elcfile} == *.elc ]]
    then
        # glob pattern or already has .elc extension, do not append .elc extension
        f=${elcfile}
    else
        f=${elcfile}.elc
    fi
    cp -v $f ${CUSTOM_DIR}/
done
