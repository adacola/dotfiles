#!/bin/sh

cd ~
for file in .gitignore_global .bash_aliases
do
	[ ! -e $file ] && ln -s ~/dotfiles/$file $file
done
mkdir -p ~/.config/git
cp ~/dotfiles/.gitignore_global ~/.config/git/ignore

mkdir -p ~/.claude
cp ~/dotfiles/claude-file-suggestion.sh ~/.claude/
