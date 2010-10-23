_grailsscripts() {
    SCRIPT_DIRS="$GRAILS_HOME/scripts ./scripts ~/.grails/scripts"
    if [ -d plugins ]
    then for PLUGIN_DIR in $(ls -d plugins/*/scripts 2> /dev/null); do
        SCRIPT_DIRS="$SCRIPT_DIRS $PLUGIN_DIR"
    done
fi

for D in $SCRIPT_DIRS; do
    if [ -d $D ]
    then ls -1 $D/*.groovy 2> /dev/null | sed -E 's/(.*)\/(.*)\.groovy/\2/' | sed -E 's/([A-Z])/-\1/g' | sed -E 's/^-//' | tr "[:upper:]" "[:lower:]"
    fi
done | sort | uniq | grep -vE "^_"
}

_grails() {
    COMPREPLY=( $(compgen -W "$(_grailsscripts)" -- ${COMP_WORDS[COMP_CWORD]}) )
}

complete -F _grails grails
