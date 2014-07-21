alias ack='ack-grep'
alias cd='pushd'
alias bd='popd'

# which process uses port
whichport(){
  netstat -atunp | grep $@
}

findbyname(){
  find . -name $@
}

tunnelcouch(){
  ssh -L5983:127.0.0.1:5984 $@
}

lsym(){
  for i in $(find -maxdepth 1 -type l -printf '%f ')
  do
    echo $i '->' $(readlink $i)
  done
}

alias cp='cp -r'

tunnel-vnc(){
  echo "enter host"
  read host
  echo "use localhost:5901 in vncviewer"
  ssh -L5901:127.0.0.1:5900 $host -p 2222
}

# a sock proxy to remote host
socks-proxy-ssh(){
  ssh -C -D 8080  $@
}

alias json-pprint='python -mjson.tool'

alias poff='sudo poweroff'

windowid() {
  xwininfo -display :0
}

max-memory(){
  ps aux | awk '{print $2, $4, $11}' | sort -k2r | head -n 10
}

disk-usage(){
  du -x . | sort -rn | more
}

uncommitted(){
  for gitdir in `find ./ -name .git`; 
  do 
    workdir=${gitdir%/*}; 
    if git --git-dir=$gitdir --work-tree=$workdir status | grep -q modified; 
    then
	echo $workdir; 
    fi
  done
}

docker-clear-all(){
  sudo docker rm `sudo docker ps -a -q` 
}

docker-clear-untagged(){
  sudo docker rmi $(sudo docker images | grep "^<none>" | awk '{print $3}')
}

mpsyt-env(){
  source /etc/bash_completion.d/virtualenvwrapper
  workon mps-youtube
}
