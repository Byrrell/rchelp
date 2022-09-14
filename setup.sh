#!/bin/bash

startdir="$(dirname -- "$(readlink -f "${BASH_SOURCE}")")"
destdir="/usr/local/bin"
defmnt="/mnt/rchelp"

echo "Adding default mount directory"

if [[ -d $defmnt ]]
then
	echo "$defmnt already exists"
else
	mkdir $defmnt && chmod 777 $defmnt
fi

echo "Installing script"

cp $startdir/rchelp.sh $destdir/rchelp && chmod +x $destdir/rchelp
