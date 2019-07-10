#!/usr/bin/env bash
set -e

cd "$(dirname "${BASH_SOURCE}")";
git pull origin master;

for i in .vimrc .tmux.conf .path .ripgrep ; do
	rm -f ~/$i
	ln -s $PWD/$i ~
done

if [ ! -d ~/.ssh ]; then
  mkdir ~/.ssh
fi

rm -f ~/.ssh/rc
ln -s $PWD/ssh/rc ~/.ssh/rc

if [ ! -d ~/bin ]; then
	mkdir ~/bin
fi
[ -d "$HOME/bin" ] || mkdir "$HOME/bin"
rm -rf ~/bin/bash
ln -s $PWD/bash ~/bin

if [ `uname -s` == "Darwin" ] ; then
  rm -f $HOME/bin/julia
  ln -s $PWD/bin/darwin/julia $HOME/bin/julia
fi
rm -f $HOME/bin/clean-path.py
ln -s $PWD/bin/clean-path.py $HOME/bin/

function please_setup() {
  echo "please source ~/dotfiles/environment in ~/.bashrc"
  exit 1
}

# check that the environment file is activated
grep 'dotfiles/environment' ~/.bashrc > /dev/null 2>&1 || please_setup

sh cargo.sh


