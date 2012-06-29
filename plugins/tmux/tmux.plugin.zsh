# see http://bionicraptor.co/2011/07/24/how-to-automatically-launch-tmux/
if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
  if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    tmux attach || tmux new; exit
  fi
fi
