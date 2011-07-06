# Aliases
alias g='git'
alias gst='git status'
alias gl='git pull'
alias gup='git fetch && git rebase'
alias gp='git push'
alias gd='git diff | mate'
alias gdv='git diff -w "$@" | vim -R -'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias gitc='git commit -a -m '
alias gits='git status '


#
# Will return the current branch name
# Usage example: git pull origin $(current_branch)
#

function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
  }

# these aliases take advangate of the previous function
alias ggpull='git pull origin $(current_branch)'
alias ggpush='git push origin $(current_branch)'
alias ggpnp='git pull origin $(current_branch) && git push origin $(current_branch)'

function git-sub-rm(){
  git rm --cached $1
  awk -v reg="submodule \"$1\"" '$0 ~ reg {c=3}!(c&&c--)'  .gitmodules >/tmp/.gitmodules
  cp /tmp/.gitmodules . 
  rm -rf $1
}
