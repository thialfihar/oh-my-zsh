#compdef manage.py

typeset -ga nul_args
nul_args=(
  '--settings=-[the Python path to a settings module.]:file:_files'
  '--pythonpath=-[a directory to add to the Python path.]::directory:_directories'
  '--traceback[print traceback on exception.]'
  "--version[show program's version number and exit.]"
  {-h,--help}'[show this help message and exit.]'
)

_managepy-adminindex(){
  _arguments -s : \
    $nul_args \
    '*::directory:_directories' && ret=0
}

_managepy-createcachetable(){
  _arguments -s : \
    $nul_args && ret=0
}

_managepy-dbshell(){
  _arguments -s : \
    $nul_args && ret=0
}

_managepy-diffsettings(){
  _arguments -s : \
    $nul_args && ret=0
}

_managepy-dumpdata(){
  _arguments -s : \
    '--format=-[specifies the output serialization format for fixtures.]:format:(json yaml xml)' \
    '--indent=-[specifies the indent level to use when pretty-printing output.]:' \
    $nul_args \
    '*::appname:_applist' && ret=0
}

_managepy-flush(){
  _arguments -s : \
    '--verbosity=-[verbosity level; 0=minimal output, 1=normal output, 2=all output.]:Verbosity:((0\:minimal 1\:normal 2\:all))' \
    '--noinput[tells Django to NOT prompt the user for input of any kind.]' \
    $nul_args && ret=0
}

_managepy-help(){
  _arguments -s : \
    '*:command:_managepy_cmds' \
    $nul_args && ret=0
}

_managepy_cmds(){
    local line
    local -a cmd
    _call_program help-command ./manage.py help \
      |& sed -n '/^ /s/[(), ]/ /gp' \
      | while read -A line; do cmd=($line $cmd) done
    _describe -t managepy-command 'manage.py command' cmd
}

_managepy-inspectdb(){
  _arguments -s : \
    $nul_args && ret=0
}

_managepy-loaddata(){
  _arguments -s : \
    '--verbosity=-[verbosity level; 0=minimal output, 1=normal output, 2=all output.]:Verbosity:((0\:minimal 1\:normal 2\:all))' \
    '*::file:_files' \
    $nul_args && ret=0
}

_managepy-reset(){
  _arguments -s : \
    '--noinput[tells Django to NOT prompt the user for input of any kind.]' \
    '*::appname:_applist' \
    $nul_args && ret=0
}

_managepy-runfcgi(){
  local state

  local fcgi_opts
  fcgi_opts=(
    'protocol[fcgi, scgi, ajp, ... (default fcgi)]:protocol:(fcgi scgi ajp)'
    'host[hostname to listen on..]:'
    'port[port to listen on.]:'
    'socket[UNIX socket to listen on.]::file:_files'
    'method[prefork or threaded (default prefork)]:method:(prefork threaded)'
    'maxrequests[number of requests a child handles before it is killed and a new child is forked (0 = no limit).]:'
    'maxspare[max number of spare processes / threads.]:'
    'minspare[min number of spare processes / threads.]:'
    'maxchildren[hard limit number of processes / threads.]:'
    'daemonize[whether to detach from terminal.]:boolean:(False True)'
    'pidfile[write the spawned process-id to this file.]:file:_files'
    'workdir[change to this directory when daemonizing.]:directory:_files'
    'outlog[write stdout to this file.]:file:_files'
    'errlog[write stderr to this file.]:file:_files'
  )

  _arguments -s : \
    $nul_args \
    '*: :_values "FCGI Setting" $fcgi_opts' && ret=0
}

_managepy-runserver(){
  _arguments -s : \
    '--noreload[tells Django to NOT use the auto-reloader.]' \
    '--adminmedia[specifies the directory from which to serve admin media.]:directory:_files' \
    $nul_args && ret=0
}

_managepy-shell(){
  _arguments -s : \
    '--plain[tells Django to use plain Python, not IPython.]' \
    $nul_args && ret=0
}

_managepy-sql(){}
_managepy-sqlall(){}
_managepy-sqlclear(){}
_managepy-sqlcustom(){}
_managepy-sqlflush(){}
_managepy-sqlindexes(){}
_managepy-sqlinitialdata(){}
_managepy-sqlreset(){}
_managepy-sqlsequencereset(){}
_managepy-startapp(){}

_managepy-syncdb() {
  _arguments -s : \
    '--verbosity=-[verbosity level; 0=minimal output, 1=normal output, 2=all output.]:Verbosity:((0\:minimal 1\:normal 2\:all))' \
    '--noinput[tells Django to NOT prompt the user for input of any kind.]' \
    $nul_args && ret=0
}

_managepy-test() {
  _arguments -s : \
    '--verbosity=-[verbosity level; 0=minimal output, 1=normal output, 2=all output.]:Verbosity:((0\:minimal 1\:normal 2\:all))' \
    '--noinput[tells Django to NOT prompt the user for input of any kind.]' \
    '*::appname:_applist' \
    $nul_args && ret=0
}

_managepy-testserver() {
  _arguments -s : \
    '--verbosity=-[verbosity level; 0=minimal output, 1=normal output, 2=all output.]:Verbosity:((0\:minimal 1\:normal 2\:all))' \
    '--addrport=-[port number or ipaddr:port to run the server on.]' \
    '*::fixture:_files' \
    $nul_args && ret=0
}

_managepy-validate() {
  _arguments -s : \
    $nul_args && ret=0
}

_managepy-commands() {
  local -a commands

  commands=()
  for cmd in $(python ./manage.py --help 2>&1 >/dev/null | \
      awk -vdrop=1 '{ if (!drop) print substr($0, 3) } /^Available subcommands/ { drop=0 }')
  do
      commands+=($cmd)
  done

  _describe -t commands 'manage.py command' commands && ret=0
}

_applist() {
  local line
  local -a apps
  _call_program help-command "python -c \"import os.path as op, re, django.conf, sys;\\
                                          bn=op.basename(op.abspath(op.curdir));[sys\\
                                          .stdout.write(str(re.sub(r'^%s\.(.*?)$' %
                                          bn, r'\1', i)) + '\n') for i in django.conf.settings.\\
                                          INSTALLED_APPS if re.match(r'^%s' % bn, i)]\"" \
                             | while read -A line; do apps=($line $apps) done
  _values 'Application' $apps && ret=0
}

_managepy() {
  local curcontext=$curcontext ret=1

  if ((CURRENT == 2)); then
    _managepy-commands
  else
    shift words
    (( CURRENT -- ))
    curcontext="${curcontext%:*:*}:managepy-$words[1]:"
    _call_function ret _managepy-$words[1]
  fi
}

compdef _managepy manage.py
compdef _managepy django
compdef _managepy django-manage
