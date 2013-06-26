
if [ -d  /usr/lib/jvm/java-6-oracle ]; then
  export JAVA_HOME=/usr/lib/jvm/java-6-oracle
else
  export JAVA_HOME=/usr/lib/jvm/java-6-openjdk-amd64
fi

export JDK_HOME=$JAVA_HOME
export VIM_HOME=~/.vim
export UTILITIES=/home/ronen/Dropbox/automation/utilities
export GRADLE_HOME=/usr/share/gradle
export LEMUR_HOME=~/lemur-1.0.1/bin
export LEIN_JAVA_CMD=/usr/lib/jvm/java-6-oracle/bin/java

if which gem > /dev/null; then
  export PATH=$PATH:`gem env gemdir`/bin
fi

if [ -f /opt/node/bin/node ] ; 
then 
  export PATH=$PATH:/opt/node/bin/
fi

if [ -f /usr/local/go/bin/go ] ; 
then 
  export PATH=$PATH:/usr/local/go/bin/
fi

if [ -f /opt/elixir/bin/iex ] ; 
then 
  export PATH=$PATH:/opt/elixir/bin/
fi


export PATH=$PATH:~/bin/:$JRUBY_HOME/bin:$GOOKUP_HOME/bin:$CLOJURE_HOME/lein:$ROO_HOME/bin:$PAX_CONS_HOME/bin:$CLOJURE_HOME/repl:$JETTY_HOME/bin:$VIM_HOME/bin:$IDEA_HOME/bin:$UTILITIES:$LEMUR_HOME:$GRADLE_HOME/bin/
