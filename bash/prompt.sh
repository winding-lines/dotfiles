command -c brew > /dev/null 2>&1
if [ $? -eq 0 ] ; then
  F=`brew --prefix git`/etc/bash_completion.d/git-prompt.sh
else
  F=$HOME/dotfiles/git-prompt.sh
fi
if [ -f $F ] ; then
  source $F
  GIT_PS1_SHOWDIRTYSTATE=true
  export PS1='\h: \W $(__git_ps1)\$ '
fi

