#!/bin/bash
startdir="$(dirname -- "$(readlink -f "${BASH_SOURCE}")")"
destdir="/usr/local/bin"
cp $startdir/rchelp.sh $destdir/rchelp
chmod +x $destdir/rchelp