command -v rustup 2> /dev/null 1>&2
if [ $? -eq 0  ] ; then
  rustup update
else
  echo "rustup not installed"
fi


command -v cargo 2> /dev/null 1>&2
if [ $? -eq 0  ] ; then
  for cmd in ripgrep bat lsd fd-find know-thy-shell ; do
    cargo install -f $cmd
  done
else
  echo "cargo not installed"
fi

