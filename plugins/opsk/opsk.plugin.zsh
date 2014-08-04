function _opsk_commands() {
    local ret=1 state
    _arguments ':subcommand:->subcommand' && ret=0

    case $state in
      subcommand)
        subcommands=(
          "bump:increase current project version"
	    "clean:clears package folder"
	    "deploy:deploy into a bintray repo"
	    "generate_chef:generates a chef based project"
	    "generate_puppet:generates a puppet based project"
	    "help:print help banner"
	    "module:generate a puppet module under static-module"
	    "package:package the project under pkg/{project name}-{version}"
	    "version:print opsk version"
        )
        _describe -t subcommands 'opsk subcommands' subcommands && ret=0
    esac

    return ret
}

compdef _opsk_commands opsk
