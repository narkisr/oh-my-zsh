alias ack='ack-grep'
alias cd='pushd'
alias bd='popd'

# which one uses port
whichport(){
	netstat -atunp | grep $@
}

findbyname(){
	find . -name $@
}

tunnelcouch(){
	ssh -L5983:127.0.0.1:5985 $@
}

lsym(){
	for i in $(find -maxdepth 1 -type l -printf '%f ')
	do
		echo $i '->' $(readlink $i)
	done
}

alias cp='cp -r'

if [ -f /etc/profile.d/autojump.zsh ]; then
	source /etc/profile.d/autojump.zsh
fi

syn-to-cld(){
    echo "enter pass"
    read -s pass
    result=`curl http://localhost:5985/_replicate -H 'Content-Type: application/json' -d "{ \"source\": \"snippets\", \"target\": \"https://narkisr:$pass@narkisr.cloudant.com/snippets\" }"`
    echo $result | python -mjson.tool
}

syn-from-cld(){
    result=`curl http://localhost:5985/_replicate -H 'Content-Type: application/json' -d "{ \"target\": \"http://localhost:5985/snippets\", \"source\": \"http://narkisr.cloudant.com/snippets\" }"`
    echo $result | python -mjson.tool
}

alias json-pprint='python -mjson.tool'
