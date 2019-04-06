if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  sessions=`tmux list-sessions`
  if [ $? == 0 ] ; then
    echo You have existing TMUX sessions
    echo "$sessions"
  fi
fi
