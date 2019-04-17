command -v cargo 2> /dev/null 1>&2
if [ $? -eq 0  ] ; then
  cargo install ripgrep
  cargo install bat
  cargo install lsd
fi

