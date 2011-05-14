export JAVA_HOME=/usr/lib/jvm/java-6-sun
export GOOKUP_HOME=/home/ronen/gookup
export CLOJURE_EXT=/home/ronen/.clojure
export JDK_HOME=$JAVA_HOME
export CLOJURE_HOME=~/.clojure
export VIM_HOME=~/.vim
export UTILITIES=/home/ronen/Dropbox/automation/utilities
export GRADLE_HOME=/home/ronen/.gradle/wrapper/dists/gradle-0.9.2

if [ -f /home/ronen/idea-IC-95.66 ]; then
  export IDEA_HOME=/home/ronen/idea-IC-95.66
fi

if [ -f /home/ronen/idea-IC-93.94 ]; then
  export IDEA_HOME=/home/ronen/idea-IC-93.94
fi

if which gem > /dev/null; then
  export PATH=$PATH:`gem env gemdir`/bin
fi

if [ -f /opt/node/bin/node ] ; 
then 
  export PATH=$PATH:/opt/node/bin/
fi

export PATH=$PATH:$JRUBY_HOME/bin:$GOOKUP_HOME/bin:$CLOJURE_HOME/lein:$ROO_HOME/bin:$PAX_CONS_HOME/bin:$CLOJURE_HOME/repl:$JETTY_HOME/bin:$VIM_HOME/bin:$IDEA_HOME/bin:$UTILITIES:$GRADLE_HOME/bin
