#!/bin/bash

help () {
echo """RCHELP - Rclone helper
Help has arrived!
[-d directory] - optional path to (un)mount (defaults to /mnt/rclone)
[-m remote] ---- mount specified rclone remote
[-u] ----------- unmount remote
[-h] ----------- help"""
}

if [ $# -eq 0 ];
then
    help
    exit 0
fi

drive="/mnt/rclone";
while getopts "d:m:uh" option; do
	case $option in
		d)
		  drive=$OPTARG
		  ;;
		m)
		  echo $drive
		  rclone mount $OPTARG: $drive --daemon
		  echo "$drive mounted to $drive"
		  ;;
		u)
		  fusermount -u $drive
		  echo "unmounted $drive"
		  ;;
		h)
		  help
		  ;;
		?)
		  echo "run rchelp -h for help" >&2
		  exit 1
		  ;; 
		
	esac
done
