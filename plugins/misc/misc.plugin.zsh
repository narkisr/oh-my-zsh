## Aliases
alias cp='cp -r'
alias v='nvim'
alias vo='nvim -o'
alias cd='pushd'
alias bd='popd'

# Which process uses port
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

# a sock proxy to remote host
socks-proxy-ssh(){
  ssh -C -D 8080  $@
}

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

load-bluethooth(){
  sudo pactl load-module module-bluetooth-discover
}

nocaps(){
  setxkbmap -option ctrl:nocaps
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

### Screecast recording
screecast() {
  cvlc screen:// --screen-fps=30 --input-slave=alsa://hw:1,0 --sout "#transcode{vcodec=h264,quality:100,scale=1,fps=30,acodec=mp4a,ab=128,channels=2, samplerate=44100}:duplicate{dst=std{access=file,mux=mp4,dst=desktop.mp4}}}"
}

killpanel() {
  if [ $XDG_CURRENT_DESKTOP = "MATE" ]
  then
    service="mate-panel"
  elif [ $XDG_CURRENT_DESKTOP = "XFCE" ]
  then
    service="xfce4-panel"
  fi

  ps aux | grep $service | head -n 1 | awk '{print $2}' | xargs kill -9
}

replace(){
  xmonad --replace &; sleep 3 && killpanel
}
