#!/bin/sh

FILES=$HOME/dotfiles/*

for file in $FILES
do
    name=$(basename $file)
    if [ $name != $(basename $0) ] && [ $name != "readme.md" ]
    then
        ln -sv $file $HOME/.$name
    fi
done

