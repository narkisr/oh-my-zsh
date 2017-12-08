alias ack='ack-grep'
alias cd='pushd'
alias bd='popd'

# which process uses port
whichport(){
  netstat -atunp | grep $@
}

findname(){
  find . -name $@
}


lsym(){
  for i in $(find -maxdepth 1 -type l -printf '%f ')
  do
    echo $i '->' $(readlink $i)
  done
}

alias cp='cp -r'
alias v='vim'
alias vo='vim -o'

# a sock proxy to remote host
socks-proxy-ssh(){
  ssh -C -D 8080  $@
}

alias json-pprint='python -mjson.tool'

alias poff='sudo poweroff'

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

init-crypt-ext4(){
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
  sudo mkfs.ext4 /dev/mapper/$name
  uuid=`uuidgen`
  echo "mounting crypt file to /tmp/$uuid"
  mkdir /tmp/$uuid
  sudo mount -t ext4 /dev/mapper/$name /tmp/$uuid
}

mount-crypt-ext4(){
  sudo losetup /dev/loop1 $1
  sudo cryptsetup luksOpen /dev/loop1 $1
  sudo mount -t ext4 /dev/mapper/$1 $2
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

nocaps(){
  setxkbmap -option ctrl:nocaps
}


### ZBackup
# run-zbackup from passfile dest
incrzbackup(){
  tar c $1 | zbackup --threads 8 --password-file  $2 backup $3/incremental-`date '+%Y-%m-%d-%s'`
}


# $1 = RAM cache size(ie 4096mb) $2 (thread count  ie 16)
zrestore(){
  zbackup restore --cache-size $1 --threads $2 --password-file $3 $4 > $5
}


### Audio device change
soundoutput(){
  if [ -z "$1" ]; then
    echo "Usage: $0 <sinkId/sinkName>" >&2
    echo "Valid sinks:" >&2
    pactl list short sinks >&2
    return
  fi

  newSink="$1"

  echo "set-default-sink $newSink" | pacmd

  pactl list short sink-inputs|while read stream; do
    streamId=$(echo $stream|cut '-d ' -f1)
    echo "moving stream $streamId"
    pactl move-sink-input "$streamId" "$newSink"
  done
}
