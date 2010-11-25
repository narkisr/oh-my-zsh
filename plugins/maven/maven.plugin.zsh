mvnci(){
  mvn clean install
  notify-send "maven clean install done :)"
}

alias mvnciskip='mvn clean install -DskipTests'
alias mvni='mvn install'
alias mvnc='mvn clean'


