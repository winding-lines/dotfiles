if [ ! -f $HOME/Library/Fonts/FiraCode-Regular.otf ] ; then
  echo Installing Fira font from https://github.com/tonsky/FiraCode/wiki
  brew tap homebrew/cask-fonts
  brew cask install font-fira-code
fi
