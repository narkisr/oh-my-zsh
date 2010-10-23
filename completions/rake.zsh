#compdef lein

typeset -A opt_args
local context state line

_arguments -s -S \
  "-C[Put Task and FileTask in the top level namespace]" \
  "--classic-namespace[Put Task and FileTask in the top level namespace]" \
  "-D[Describe the tasks (matching optional PATTERN), then exit.]" \
  "--describe[Describe the tasks (matching optional PATTERN), then exit.]" \
  "-n[Do a dry run without executing actions.]" \
  "--dry-run[Do a dry run without executing actions.]" \
  "-e[Execute some Ruby code and exit.]" \
  "--execute[Execute some Ruby code and exit.]" \
  "-p[Execute some Ruby code, print the result, then exit.]" \
  "--execute-print[Execute some Ruby code, print the result, then exit.]" \
  "-E[Execute some Ruby code, then continue with normal task processing.]" \
  "--execute-continue[Execute some Ruby code, then continue with normal task processing.]" \
  "-I[Include LIBDIR in the search path for required modules.]" \
  "--libdir[Include LIBDIR in the search path for required modules.]" \
  "-P[Display the tasks and dependencies, then exit.]" \
  "--prereqs[Display the tasks and dependencies, then exit.]" \
  "-q[Do not log messages to standard output.]" \
  "--quiet[Do not log messages to standard output.]" \
  "-f[Use FILE as the rakefile.]" \
  "--rakefile[Use FILE as the rakefile.]" \
  "-R[Auto-import any .rake files in RAKELIBDIR. (default is 'rakelib')]" \
  "--rakelibdir[Auto-import any .rake files in RAKELIBDIR. (default is 'rakelib')]" \
  "--rakelib[Auto-import any .rake files in RAKELIBDIR. (default is 'rakelib')]" \
  "-r[Require MODULE before executing rakefile.]" \
  "--require[Require MODULE before executing rakefile.]" \
  "--rules[Trace the rules resolution.]" \
  "-N[Do not search parent directories for the Rakefile.]" \
  "--no-search[Do not search parent directories for the Rakefile.]" \
  "--nosearch[Do not search parent directories for the Rakefile.]" \
  "-s[Like --quiet, but also suppresses the 'in directory' announcement.]" \
  "--silent[Like --quiet, but also suppresses the 'in directory' announcement.]" \
  "-g[Using system wide (global) rakefiles (usually '~/.rake/*.rake').]" \
  "--system[Using system wide (global) rakefiles (usually '~/.rake/*.rake').]" \
  "-G[Use standard project Rakefile search paths, ignore system wide rakefiles.]" \
  "--no-system[Use standard project Rakefile search paths, ignore system wide rakefiles.]" \
  "--nosystem[Use standard project Rakefile search paths, ignore system wide rakefiles.]" \
  "-T[Display the tasks (matching optional PATTERN) with descriptions, then exit.]" \
  "--tasks[Display the tasks (matching optional PATTERN) with descriptions, then exit.]" \
  "-t[Turn on invoke/execute tracing, enable full backtrace.]" \
  "--trace[Turn on invoke/execute tracing, enable full backtrace.]" \
  "-v[Log message to standard output.]" \
  "--verbose[Log message to standard output.]" \
  "-V[Display the program version.]" \
  "--version[Display the program version.]" \
  "-h[Display this help message.]" \
  "-H[Display this help message.]" \
  "--help[Display this help message.]" \
  '*:file:_files' && return 0
