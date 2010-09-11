export JAVA_HOME=/usr/lib/jvm/java-6-sun
export GOOKUP_HOME=/home/ronen/gookup
export CLOJURE_EXT=/home/ronen/.clojure
export JDK_HOME=$JAVA_HOME
export JRUBY_HOME=/home/ronen/.jruby/jruby-1.3.1
export CLOJURE_HOME=~/.clojure
export GEM_PATH=`gem env gemdir`/bin
export VIM_HOME=~/.vim

if [ -f /home/ronen/idea-IC-95.66 ]; then
  export IDEA_HOME=/home/ronen/idea-IC-95.66
fi

if [ -f /home/ronen/idea-IC-93.94 ]; then
  export IDEA_HOME=/home/ronen/idea-IC-93.94
fi

export PATH=$PATH:$JRUBY_HOME/bin:$GROOVY_HOME/bin:$GOOKUP_HOME/bin:$CLOJURE_HOME/lein:$ROO_HOME/bin:$PAX_CONS_HOME/bin:$CLOJURE_HOME/repl:$JETTY_HOME/bin:$GEM_PATH:$$VIM_HOME/bin:$IDEA_HOME/bin