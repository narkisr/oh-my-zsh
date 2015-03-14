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
alias v='vi'
alias vo='vi -o'

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

init-crypt(){
  cwd=`pwd`
  echo "enter name"
  read name
  echo "enter size (in MB)"
  read size
  fallocate -l "${size}M"  $cwd/$name 
  echo "$cwd/$name"
  sudo losetup /dev/loop1 $cwd/$name
  sudo cryptsetup luksFormat --cipher=serpent-xts-plain64 --hash=sha256 /dev/loop1 
  sudo cryptsetup luksOpen /dev/loop1 $name
  sudo mkfs.btrfs /dev/mapper/$name
  uuid=`uuidgen`
  mkdir /tmp/$uuid
  sudo mount -t btrfs -o compress=lzo /dev/mapper/$name /tmp/$uuid
}

umount-crypt(){
  sudo umount $2
  sudo cryptsetup luksClose $1 
  sudo losetup -d /dev/loop1
}

mount-crypt(){
  sudo losetup /dev/loop1 $1
  sudo cryptsetup luksOpen /dev/loop1 $1
  sudo mount -t btrfs -o compress=lzo /dev/mapper/$1 $2
}

vbox-folder(){
  VBoxManage setproperty machinefolder $1
}

running-vms(){
  VBoxManage list runningvms
}

stop-all-vms(){
  vboxmanage list runningvms | sed -r 's/.*\{(.*)\}/\1/' | xargs -L1 -I {} VBoxManage controlvm {} poweroff
}

load-bluethooth(){
  sudo pactl load-module module-bluetooth-discover
}
