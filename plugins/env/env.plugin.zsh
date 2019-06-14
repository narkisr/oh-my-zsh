
# export LC_ALL=en_US.UTF-8

if [ -d  /usr/lib/jvm/java-1.8.0-amazon-corretto/ ]; then
  export JAVA_HOME=/usr/lib/jvm/java-1.8.0-amazon-corretto/
elif [ -d /usr/lib/jvm/java-11-amazon-corretto/ ]; then
  export JAVA_HOME=/usr/lib/jvm/java-11-amazon-corretto/
fi

export JDK_HOME=$JAVA_HOME
export VIM_HOME=~/.vim
export GEM_HOME=~/.gems
export GRADLE_HOME=/usr/share/gradle
export LEIN_JAVA_CMD=/usr/bin/java

export PATH=$PATH:~/bin:$GEM_HOME/bin/
