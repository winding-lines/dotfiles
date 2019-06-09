F=`brew --prefix git`/etc/bash_completion.d/git-prompt.sh
if [ -f $F ] ; then
  source $F
  GIT_PS1_SHOWDIRTYSTATE=true
  export PS1='\h: \w $(__git_ps1)\$ '
fi

