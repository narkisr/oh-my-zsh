function _librarian-puppet_commands() {
    local ret=1 state
    _arguments ':subcommand:->subcommand' && ret=0

    case $state in
      subcommand)
        subcommands=(
          "clean:clean out the cache"
	    "config:show and edit the config"
	    "help:describe available commands"
	    "init:initialized current directory"
	    "install:resolves and install all dependencies"
	    "outdated:list outdated dependencies"
	    "package:cache the puppet modules in vendor/puppet/cache"
	    "show:shows dependencies"
	    "update:updates and installs the dependencies"
	    "version:print version"
        )
        _describe -t subcommands 'librarian-puppet subcommands' subcommands && ret=0
    esac

    return ret
}

compdef _librarian-puppet_commands librarian-puppet
