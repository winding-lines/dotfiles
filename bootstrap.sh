#!/usr/bin/env bash
set -e

ssh-add -l | grep .ssh/git- > /dev/null 2>&1
if [ $? -eq 0 ] ; then
  cd "$(dirname "${BASH_SOURCE}")";
  git pull origin master;
else
  echo "To update to latest please git-add ~/.ssh/git-*"
fi


for i in .vimrc .tmux.conf .path .ripgrep ; do
	rm -f ~/$i
	ln -s $PWD/$i ~
done

[ -d $HOME/.config ] || mkdir $HOME/.config

for i in starship.toml ; do
  rm -f ~/.config/$i
  ln -s $PWD/$i ~/.config
done

function setup_vi() {
  if [[ -f /etc/rpi-issue ]] ; then
     dpkg -s vim > /dev/null 2>&1
     if [[ $? -gt 0 ]] ; then
        sudo apt-get update && sudo apt-get install -y vim
     fi
  fi
  VIMRC=$HOME/.vim/rc
  if [[ ! -L "$file" || ! -d "$file" ]] ; then
      rm -rf $VIMRC
      mkdir -p ~/.vim
      ln -s ~/dotfiles/.vim/rc $VIMRC
  fi
  PLUG=$HOME/.vim/autoload/plug.vim
  if [[ ! -f $PLUG ]] ; then
    curl -fLo $PLUG --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim -c PlugInstall
  fi

}

setup_vi

[[ -d "$HOME/.ssh" ]] || mkdir "$HOME/.ssh"

rm -f ~/.ssh/rc
ln -s $PWD/ssh/rc ~/.ssh/rc

function bin_setup() {
  [[ -d "$HOME/bin" ]] || mkdir "$HOME/bin"
  rm -rf ~/bin/bash
  ln -s $PWD/bash ~/bin

  if [ `uname -s` == "Darwin" ] ; then
    rm -f $HOME/bin/julia
    ln -s $PWD/bin/darwin/julia $HOME/bin/julia
  fi
  rm -f $HOME/bin/clean-path.py
  ln -s $PWD/bin/clean-path.py $HOME/bin/
}

bin_setup

function please_setup() {
  for i in .bashrc .bash_profile ; do
    if [[ -f "$HOME/$i" ]] && grep -q 'dotfiles/environment' "$HOME/$i" ; then
      return
    fi
  done
  echo "please source ~/dotfiles/environment in ~/.bashrc or ~/.bash_profile"
  exit 1
}

# check that the environment file is activated
please_setup

source cargo.sh


