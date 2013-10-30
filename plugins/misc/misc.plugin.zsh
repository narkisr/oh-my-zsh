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

syn-to-cld(){
    echo "enter pass"
    read -s pass
    result=`curl -X POST http://localhost:5984/_replicate -H 'Content-Type: application/json' -d "{ \"source\": \"snippets\", \"target\": \"http://narkisr:$pass@narkisr.cloudant.com/snippets\" }"`
    echo $result | python -mjson.tool
}

syn-from-cld(){
    result=`curl -X POST http://localhost:5984/_replicate -H 'Content-Type: application/json' -d "{ \"target\": \"http://localhost:5984/snippets\", \"source\": \"http://narkisr.cloudant.com/snippets\" }"`
    echo $result | python -mjson.tool
}

syn-from-cone(){
    result=`curl -X POST http://localhost:5984/_replicate -H 'Content-Type: application/json' -d "{ \"target\": \"http://localhost:5984/snipapp-restruct\", \"source\": \"http://narkisr.couchone.com/snipapp-restruct\" }"`
    echo $result | python -mjson.tool
}

syn-to-cone(){
    echo "enter pass"
    read -s pass
    result=`curl -X POST http://localhost:5984/_replicate -H 'Content-Type: application/json' -d "{ \"source\": \"snipapp-restruct\", \"target\": \"http://remote:$pass@narkisr.couchone.com/snipapp-restruct\" }"`
    echo $result | python -mjson.tool
}

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
