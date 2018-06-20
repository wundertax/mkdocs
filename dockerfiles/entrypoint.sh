#!/bin/bash
set -e

# Colors
# Vars
ESC_SEQ="\\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"

MKDOCS_PROJECT=$2

# Error
error_exit() {
	echo -en "$COL_RED$1$COL_RESET" 1>&2
	exit 1
}

appNew () {
	echo -en "$COL_YELLOW=> Creating New Project:$COL_RESET\\n"
	mkdocs new "$MKDOCS_PROJECT"
}

appBuild () {
	echo -en "$COL_YELLOW=> Building HTML:$COL_RESET\\n"
	mkdocs build --clean
}

appVersion () {
	echo -en "$COL_YELLOW=> Curent Versions:$COL_RESET\\n"
	pip freeze | grep mkdocs
}

appServe () {
	echo -en "$COL_YELLOW=> Starting Serve Mode:$COL_RESET\\n"
	mkdocs serve --dev-addr=0.0.0.0:8000
}

appHelp () {
	echo -en "$COL_YELLOW Available options:$COL_RESET\\n"
	echo -en "$COL_GREEN serve <project>$COL_RESET - Start a web server for the project\\n"
	echo -en "$COL_GREEN new <project>$COL_RESET   - Create a new project\\n"
	echo -en "$COL_GREEN build <project>$COL_RESET - Build the project\\n"
	echo -en "$COL_GREEN version$COL_RESET         - Show mkdocs version\\n"
	echo -en "$COL_GREEN help$COL_RESET            - Displays the help\\n"
	echo -en "$COL_GREEN [command]$COL_RESET       - Execute the specified linux command\\n"
}

# This avoids permission denied if the data volume is mounted by root
chown -R wt /docs

case "$1" in
  serve)
    appServe
    ;;
  new)
    appNew
    ;;
  build)
    appBuild
    ;;
  version)
    appVersion
    ;;
  help)
    appHelp
    ;;
  *)
    if [ -x "$1" ]; then
      $1
    else
      prog=$(command -v "$1")
      if [ -n "${prog}" ] ; then
        shift 1
        exec su-exec ttd "$prog" "$@"
      else
        appHelp
      fi
    fi
    ;;
esac

exit 0



#exec su-exec $@
# Re-set permission to the `wt` user
# Run as user `wt`
# This avoids permission denied if the data volume is mounted by root

exec su-exec wt "$@"

