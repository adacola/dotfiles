#!/bin/sh

cd ~
for file in .gitignore .bash_aliases
do
	[ ! -e $file ] && ln -s ~/dotfiles/$file $file
done
