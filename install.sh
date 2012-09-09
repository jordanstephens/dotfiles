#!/bin/sh

FILES=$HOME/dotfiles/*

for file in $FILES
do
    name=$(basename $file)
    if [ $name != $(basename $0) ]
    then
        ln -sv $file $HOME/.$name
    fi
done

