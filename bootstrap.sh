#!/usr/bin/env bash
set -e

cd "$(dirname "${BASH_SOURCE}")";
git pull origin master;

for i in .vimrc .tmux.conf ; do
	rm -f ~/$i
	ln -s $PWD/$i ~
done

if [ ! -d ~/bin ]; then
	mkdir ~/bin
fi
rm -rf ~/bin/bash
ln -s $PWD/bash ~/bin
