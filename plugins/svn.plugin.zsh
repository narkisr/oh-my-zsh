# SCM aliases 
alias svns='svn status'
alias svnu='svn update'
alias svnc='svn commit -m'

svnadd(){
 svn status| awk /$@/'{print $2}'| xargs svn add
}
svnrev(){
 svn status| awk /$@/'{print $2}'| xargs svn revert
}
svndiff(){
 svn status| awk /$@/'{print $2}'| xargs svn diff
}


