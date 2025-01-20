#! /bin/bash


echo "Installing the plugin manager"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if test -f ~/.vimrc; then
	read -p "Detected an already existing .vimrc, would you like to replace it? [Y/n] " prompt
	if [ "$prompt" = "Y" ]; then
		if test -f ./.vimrc; then 
			echo "vimrc in installation directory found"
			rm ~/.vimrc
			echo "removed old vimrc"
			mv .vimrc $HOME
			echo "Moved in the new vimrc"
		else
			echo "vimrc not found, have you already ran this file?"
		fi
	else
		echo "Keeping the old vimrc"
	fi
else
	if test -f ./.vimrc; then 
		echo "vimrc in installation directory found"
		mv .vimrc $HOME
	else
		echo "vimrc not found, have you already ran this file?"
	fi
fi
read -p "Would you like to make vimtree open by default? [Y/n] " prompt2

if [ "$prompt2" = "Y" ]; then
	if ! test -f ~/.bash_aliases; then
		echo "~/.bash_aliases not found, creating one"
		touch ~/.bash_alises
	fi
	echo "Writing into .bash_aliases..."
	echo alias nvim="nvim -c 'NvimTreeOpen'" >> ~/.bash_aliases
fi

nvim -c "PlugInstall"
