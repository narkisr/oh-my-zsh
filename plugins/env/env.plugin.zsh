
# export LC_ALL=en_US.UTF-8

if [ -d  /usr/lib/jvm/java-8-oracle ]; then
  export JAVA_HOME=/usr/lib/jvm/java-8-oracle
elif [ -d /usr/lib/jvm/java-8-openjdk-amd64/ ]; then
  export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
fi

export JDK_HOME=$JAVA_HOME
export VIM_HOME=~/.vim
export GEM_HOME=~/.gems
export GRADLE_HOME=/usr/share/gradle
export LEIN_JAVA_CMD=/usr/bin/java

export PATH=$PATH:$GEM_HOME/bin/
