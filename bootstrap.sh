#!/usr/bin/env bash
set -e

cd "$(dirname "${BASH_SOURCE}")";
git pull origin master;

for i in .vimrc .tmux.conf .path .ripgrep ; do
	rm -f ~/$i
	ln -s $PWD/$i ~
done

if [ ! -d ~/bin ]; then
	mkdir ~/bin
fi
[ -d "$HOME/bin" ] || mkdir "$HOME/bin"
rm -rf ~/bin/bash
ln -s $PWD/bash ~/bin

if [ `uname -s` == "Darwin" ] ; then
  rm -f $HOME/bin/julia
  ln -s $PWD/bin/julia-darwin $HOME/bin/julia
fi

sh cargo.sh
