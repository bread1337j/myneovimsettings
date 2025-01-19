#! /bin/bash


echo "Installing the plugin manager"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if test -f ./.vimrc; then 
	echo "vimrc found"
	mv .vimrc $HOME
else
	echo "vimrc not found, have you already ran this file?"
fi

