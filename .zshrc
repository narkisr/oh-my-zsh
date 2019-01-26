# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="sonicradish"

plugins=(git env misc tar gitflow lein amazon tmux git-extras vi-mode git-aliases docker tmuxinator history-substring-search z)

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
