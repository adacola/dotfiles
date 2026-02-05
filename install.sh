#!/bin/sh

echo ".gitignore_global と .bash_aliases のシンボリックリンクを ~/ に作成"
cd ~
for file in .gitignore_global .bash_aliases
do
	[ ! -e $file ] && ln -s ~/dotfiles/$file $file
done

echo ".gitignore_global を ~/.config/git/ignore にコピー"
mkdir -p ~/.config/git
cp ~/dotfiles/.gitignore_global ~/.config/git/ignore

echo "Claude Codeのファイル名補完スクリプトを ~/.claude/ にコピー"
mkdir -p ~/.claude
cp ~/dotfiles/claude-file-suggestion.sh ~/.claude/

echo "Claude Codeのファイル名補完スクリプト実行に必要なコマンドをインストール"
sudo apt update && sudo apt install fd-find fzf && ln -s $(which fdfind) ~/.local/bin/fd
