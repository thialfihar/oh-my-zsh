#compdef manage.py

typeset -ga nul_args
nul_args=(
  '--verbosity=-[verbosity level; 0=minimal output, 1=normal output, 2=all output.]:Verbosity:((0\:minimal 1\:normal 2\:all))'
  '--settings=-[the Python path to a settings module.]:file:_files'
  '--pythonpath=-[a directory to add to the Python path.]:directory:_directories'
  '--traceback[print traceback on exception.]'
  "--no-color[Don't colorize the command output.]"
  "--version[show program's version number and exit.]"
  {-h,--help}'[show this help message and exit.]'
)

typeset -ga start_args
start_args=(
  '--template=-[The path or URL to load the template from.]:directory:_directories'
  '--extension=-[The file extension(s) to render (default: "py").]'
  '--name=-[The file name(s) to render.]:file:_files'
)

typeset -ga db_args
db_args=(
  '--database=-[Nominates a database. Defaults to the "default" database.]'
)

typeset -ga noinput_args
noinput_args=(
  '--noinput[tells Django to NOT prompt the user for input of any kind.]'
)

typeset -ga no_init_data_args
no_init_data_args=(
  '--no-initial-data[Tells Django not to load any initial data after database synchronization.]'
)

typeset -ga tag_args
tag_args=(
  '--tag=-[Run only checks labeled with given tag.]'
  '--list-tags[List available tags.]'
)

_managepy-check(){
  _arguments -s : \
    $tag_args \
    $nul_args && ret=0
}

_managepy-changepassword(){
  _arguments -s : \
    $db_args \
    $nul_args && ret=0
}

_managepy-createcachetable(){
  _arguments -s : \
    $db_args \
    $nul_args && ret=0
}

_managepy-createsuperuser(){
  _arguments -s : \
    '--username=-[Specifies the login for the superuser.]' \
    '--email=-[Specifies the email for the superuser.]' \
    $noinput_args \
    $db_args \
    $nul_args && ret=0
}

_managepy-collectstatic(){
  _arguments -s : \
    '--link[Create a symbolic link to each file instead of copying.]' \
    '--no-post-process[Do NOT post process collected files.]' \
    '--ignore=-[Ignore files or directories matching this glob-style pattern. Use multiple times to ignore more.]' \
    '--dry-run[Do everything except modify the filesystem.]' \
    '--clear[Clear the existing files using the storage before trying to copy or link the original file.]' \
    '--link[Create a symbolic link to each file instead of copying.]' \
    '--no-default-ignore[Do not ignore the common private glob-style patterns "CVS", ".*" and "*~".]' \
    $noinput_args \
    $nul_args && ret=0
}

_managepy-dbshell(){
  _arguments -s : \
    $db_args \
    $nul_args && ret=0
}

_managepy-diffsettings(){
  _arguments -s : \
    "--all[Display all settings, regardless of their value.]"
    $nul_args && ret=0
}

_managepy-dumpdata(){
  _arguments -s : \
    '--format=-[Specifies the output serialization format for fixtures.]:format:(json yaml xml)' \
    '--indent=-[Specifies the indent level to use when pretty-printing output.]' \
    '--exclude=-[An app_label or app_label.ModelName to exclude (use multiple --exclude to exclude multiple apps/models).]' \
    '--natural-foreign[Use natural foreign keys if they are available.]' \
    '--natural-primary[Use natural primary keys if they are available.]' \
    "--all[Use Django's base manager to dump all models stored in the database.]" \
    '--pks=-[Only dump objects with given primary keys.]' \
    $db_args \
    $nul_args \
    '*::appname:_applist' && ret=0
}

_managepy-flush(){
  _arguments -s : \
    $no_init_data_args \
    $db_args \
    $noinput_args \
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
    $db_args \
    $nul_args && ret=0
}

_managepy-loaddata(){
  _arguments -s : \
    '--ignorenonexistent[Ignores entries in the serialized data for fields that do not currently exist on the model.]' \
    '--app=-[Only look for fixtures in the specified app.]:appname:_applist' \
    '*::file:_files' \
    $db_args \
    $nul_args && ret=0
}

_managepy-makemessages(){
  _arguments -s : \
    '--locale=-[Creates or updates the message files for the given locale(s) (e.g. pt_BR).]' \
    '--domain=-[The domain of the message files (default: "django").]' \
    '--all[Updates the message files for all existing locales.]' \
    '--extension=-[The file extension(s) to examine (default: "html,txt", or "js" if the domain is "djangojs").]' \
    '--symlinks[Follows symlinks to directories when examining source code and templates for translation strings.]' \
    '--ignore=-[Ignore files or directories matching this glob-style pattern.]' \
    "--no-default-ignore[Don't ignore the common glob-style patterns 'CVS', '.*', '*~' and '*.pyc'.]" \
    "--no-wrap[Don't break long message lines into several lines.]" \
    "--no-location[Don't write '#: filename:line' lines.]" \
    '--no-obsolete[emove obsolete message strings.]' \
    '--keep-pot[Keep .pot file after making messages.]' \
    $nul_args && ret=0
}
_managepy-makemigrations(){
  _arguments -s : \
    '--dry-run[Just show what migrations would be made]' \
    '--merge[Enable fixing of migration conflicts.]' \
    '--empty[Create an empty migration.]' \
    $noinput_args \
    $nul_args && ret=0
}
_managepy-migrate(){
  _arguments -s : \
    '--fake[Mark migrations as run without actually running them]' \
    '--list[Show a list of all known migrations and which are applied]' \
    $no_init_data_args \
    $noinput_args \
    $db_args \
    $nul_args && ret=0
}

_managepy-runfcgi(){
  local state

  local fcgi_opts
  fcgi_opts=(
    'protocol[fcgi, scgi, ajp, ... (default fcgi)]:protocol:(fcgi scgi ajp)'
    'host[hostname to listen on..]:'
    'port[port to listen on.]:'
    'socket[UNIX socket to listen on.]:file:_files'
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
    '--ipv6[Tells Django to use an IPv6 address.]' \
    '--nothreading[Tells Django to NOT use threading.]' \
    '--noreload[Tells Django to NOT use the auto-reloader.]' \
    '--nostatic[Tells Django to NOT automatically serve static files at STATIC_URL.]' \
    '--insecure[Allows serving static files even if DEBUG is False.]' \
    $nul_args && ret=0
}

_managepy-shell(){
  _arguments -s : \
    '--plain[Tells Django to use plain Python, not IPython.]' \
    '--no-startup[When using plain Python, ignore the PYTHONSTARTUP environment variable and ~/.pythonrc.py script.]' \
    '--interface=-[Specify an interactive interpreter interface.]:INTERFACE:((ipython bpython))' \
    $nul_args && ret=0
}

_managepy-sql(){
  _arguments -s : \
    $db_args \
    $nul_args && ret=0
}

_managepy-sqlall(){
  _arguments -s : \
    $db_args \
    $nul_args && ret=0
}

_managepy-sqlclear(){
  _arguments -s : \
    $db_args \
    $nul_args && ret=0
}

_managepy-sqlcustom(){
  _arguments -s : \
    $db_args \
    $nul_args && ret=0
}

_managepy-dropindexes(){
  _arguments -s : \
    $db_args \
    $nul_args && ret=0
}

_managepy-sqlflush(){
  _arguments -s : \
    $db_args \
    $nul_args && ret=0
}

_managepy-sqlindexes(){
  _arguments -s : \
    $db_args \
    $nul_args && ret=0
}

_managepy-sqlinitialdata(){
  _arguments -s : \
    $nul_args && ret=0
}

_managepy-sqlsequencereset(){
  _arguments -s : \
    $db_args \
    $nul_args && ret=0
}

_managepy-squashmigrations(){
  _arguments -s : \
    '--no-optimize[Do not try to optimize the squashed operations.]' \
    $noinput_args \
    $nul_args && ret=0
}

_managepy-startapp(){
  _arguments -s : \
    $start_args \
    $nul_args && ret=0
}
_managepy-startproject(){
  _arguments -s : \
    $start_args \
    $nul_args && ret=0
}

_managepy-syncdb() {
  _arguments -s : \
    $noinput_args \
    $no_init_data_args \
    $db_args \
    $nul_args && ret=0
}

_managepy-test() {
  _arguments -s : \
    '--failfast[Tells Django to stop running the test suite after first failed test.]' \
    '--testrunner=-[Tells Django to use specified test runner class instead of the one specified by the TEST_RUNNER setting.]' \
    '--liveserver=-[Overrides the default address where the live server (used with LiveServerTestCase) is expected to run from. The default value is localhost:8081.]' \
    '--top-level-directory=-[Top level of project for unittest discovery.]' \
    '--pattern=-[The test matching pattern. Defaults to test*.py.]:' \
    $noinput_args \
    '*::appname:_applist' \
    $nul_args && ret=0
}

_managepy-testserver() {
  _arguments -s : \
    '--addrport=-[port number or ipaddr:port to run the server on.]' \
    '--ipv6[Tells Django to use an IPv6 address.]' \
    $noinput_args \
    '*::fixture:_files' \
    $nul_args && ret=0
}

_managepy-validate() {
  _arguments -s : \
    $tag_args \
    $nul_args && ret=0
}

_managepy-commands() {
  local -a commands

  commands=()
  for cmd in $(python ./manage.py --help 2>&1 | egrep '^[ ]{4}[^ ]')
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
compdef _managepy django-admin
compdef _managepy django-admin.py
compdef _managepy django-manage
