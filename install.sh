#!/bin/sh

echo ".gitignore_global と .bash_aliases のシンボリックリンクを ~/ に作成"
cd ~
for file in .gitignore_global .bash_aliases
do
	[ ! -e $file ] && ln -s ~/dotfiles/$file $file
done

echo ".gitignore_global のシンボリックリンクを ~/.config/git/ignore に作成"
mkdir -p ~/.config/git
[ ! -e ~/.config/git/ignore ] && ln -s ~/dotfiles/.gitignore_global ~/.config/git/ignore

echo "Claude Code関連のスクリプトを ~/.claude/ にコピー"
mkdir -p ~/.claude
cp ~/dotfiles/claude-file-suggestion.sh ~/.claude/
cp ~/dotfiles/claude-statusline.sh ~/.claude/

echo "devconteiner内でClaude Codeのユーザー設定を共通化するためにユーザー名の相違を解決"
[ "$REMOTE_CONTAINERS" = "true" ] && sudo mkdir -p /home/adacola && sudo chown $(whoami): /home/adacola && ln -s ~/.claude /home/adacola/.claude

echo "Claude Codeのファイル名補完スクリプト実行に必要なコマンドをインストール"
sudo apt update && sudo apt install -y fd-find fzf ripgrep
[ ! -e ~/.local/bin/fd ] && ln -s $(which fdfind) ~/.local/bin/fd

echo "tmux をインストール"
sudo apt install -y tmux
[ ! -e ~/.config/tmux/tmux.conf ] && mkdir -p ~/.config/tmux/plugins && ln -s ~/dotfiles/tmux.conf ~/.config/tmux/tmux.conf
[ ! -d ~/.config/tmux/plugins/tpm ] && git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

echo ""
echo "インストール完了！"
