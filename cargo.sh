command -v cargo 2> /dev/null 1>&2
if [ $? -eq 0  ] ; then
  for cmd in ripgrep bat lsd ; do
    cargo install -f $cmd
  done
fi

