
if [ -f  /usr/lib/jvm/java-6-sun ]; then
  export JAVA_HOME=/usr/lib/jvm/java-6-sun
else
  export JAVA_HOME=/usr/lib/jvm/java-6-openjdk-amd64
fi

export JDK_HOME=$JAVA_HOME
export VIM_HOME=~/.vim
export UTILITIES=/home/ronen/Dropbox/automation/utilities
export GRADLE_HOME=/usr/share/gradle-1.0/
export LEMUR_HOME=~/lemur-1.0.1/bin
export LEIN_JAVA_CMD=/usr/lib/jvm/java-6-sun/bin/java

if which gem > /dev/null; then
  export PATH=$PATH:`gem env gemdir`/bin
fi

if [ -f /opt/node/bin/node ] ; 
then 
  export PATH=$PATH:/opt/node/bin/
fi


export PATH=$PATH:$JRUBY_HOME/bin:$GOOKUP_HOME/bin:$CLOJURE_HOME/lein:$ROO_HOME/bin:$PAX_CONS_HOME/bin:$CLOJURE_HOME/repl:$JETTY_HOME/bin:$VIM_HOME/bin:$IDEA_HOME/bin:$UTILITIES:$GRADLE_HOME/bin:$LEMUR_HOME
