#! /bin/bash

if test -f ./.vimrc; then 
	echo "vimrc found"
	mv .vimrc $HOME
else
	echo "vimrc not found, have you already ran this file?"
fi

