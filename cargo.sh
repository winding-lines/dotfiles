if [[ -f $HOME/.cargo/bin/rg ]] ; then
  echo
  RG=`stat /Users/mseritan/.cargo/bin/rg | cut -f 2 -d '"'`
  echo -n "Note: ripgrep exists and has last been changed on $RG"
  echo
fi

read -p "Update rust and cargo commands? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  command -v rustup 2> /dev/null 1>&2
  if [ $? -eq 0  ] ; then
    rustup update
  else
    echo "ERROR: rustup not installed"
    echo "Please see http://rustup.rs"
    exit 1
  fi


  command -v cargo 2> /dev/null 1>&2
  if [ $? -eq 0  ] ; then
    for cmd in ripgrep bat lsd fd-find starship ; do
      cargo install -f $cmd
    done
  else
    echo "cargo not installed"
  fi
fi
