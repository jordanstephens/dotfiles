#!/bin/sh

FILES=$HOME/dotfiles/*

echo "Symlinking config files to $HOME"
for file in $FILES
do
    name=$(basename $file)
    if [ $name != $(basename $0) ] && [ $name != "readme.md" ]
    then
	ln -sv $file $HOME/.$name
    fi
done


echo "Initializing and updating git submodules"
git submodule update --init


if [ -f /bin/zsh ]
then
	echo "Changing login shell to /bin/zsh"
	chsh -s /bin/zsh # change login shell to zsh
  /bin/zsh # use zsh now
else
	echo "Could not find /bin/zsh, login shell will remain $SHELL"
fi

