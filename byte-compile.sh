#!/bin/bash

for EL in `find . -type f -name "*.el"`
do
    emacs -batch -f batch-byte-compile ./ $EL
done
