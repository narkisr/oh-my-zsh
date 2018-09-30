# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="sonicradish"

plugins=(git env misc tar lein amazon tmux cap git-extras vi-mode git-aliases docker tmuxinator mix history-substring-search z kubectl helm)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
set -o vi
bindkey '^R' history-incremental-search-backward
# SHIFT-TAB can do a reverse-menu-complete http://tinyurl.com/36gl95l !
bindkey '^[[Z' reverse-menu-complete
export EDITOR="vi"
if [[ ! -s $DISPLAY && `which wmname` == "0" ]]; then
  wmname LG3D
fi

# This loads RVM into a shell session (see http://tinyurl.com/5svjj4o  for diverting from default).

if [ -f "/home/ronen/.rvm/scripts/rvm" ]; then
  [[ -s "/home/ronen/.rvm/scripts/rvm" ]] && . "/home/ronen/.rvm/scripts/rvm"
elif [ -d "/media/contents/rvm" ]; then
  # see https://stackoverflow.com/questions/15282509/how-to-change-rvm-install-location
  export rvm_path=/media/contents/rvm
  . "/media/contents/rvm/scripts/rvm"
else
  [[ -s "/usr/local/rvm/scripts/rvm" ]] && . "/usr/local/rvm/scripts/rvm"
fi
# enabling 256 colors
TERM=xterm-256color

if [ -f "$HOME/keys.zsh" ]; then
  source "$HOME/keys.zsh"
fi

alias sudo='sudo env PATH=$PATH'
alias sudo='nocorrect sudo' # see http://tinyurl.com/8xb3pbk

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -s ~/.scm_breeze/scm_breeze.sh ] && source ~/.scm_breeze/scm_breeze.sh
[ -s ~/.oh-my-zsh/locally.sh ] && source ~/.oh-my-zsh/locally.sh
