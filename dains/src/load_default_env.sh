#!/bin/bash



# Ancillary functions
exitMsg() { echo "# $(date) --- FATAL ---"; echo -e "$@"; exit 1; }
debug()   {  ifDebug echo -e "# $(date +%Y-%m-%dT%H:%M:%S)@$HOSTNAME:\t$(echo "$@" | tr "\n" " ")" ; }
cmd()     { debug "$@"; $@; }
ifDebug() { if [[ "$DEBUG" != "" ]]; then $@ ; fi; }



# epena
export DLAB_USERID=$(id -u)
export DLAB_GROUPID=$(id -g)

export DLAB_DOCKER_GROUP=$(grep docker /etc/group | cut -d ':' -f 3)
stacks=()

echo ${stacks[@]}
#for i in "${stacks[@]}"; do echo "$i" ; done
# end epena

if [[ "$DLAB_ENVFILE" == "" ]]; then
	echo "DLAB_ENVFILE must be set. Check the ../README"
	exit 1
fi

ENVFILE=$(basename $DLAB_ENVFILE)
if [ ! -e ../config/$ENVFILE ]; then
	echo "$ENVFILE not found in ../config/. Try again, or better yet, read the ../README"
	sleep 4
	echo; echo "... ok .... Here is the README ..."; echo; echo
	sleep 2
	cat ../README
	exit 1
fi

source ../config/$ENVFILE


for i in $(env | grep DLAB); do	debug "$i"; done


# Check DLAB_HOME

if [[ "$DLAB_HOME" == "" ]]; then
	echo "DLAB_HOME must be set in ../config/$ENVFILE"
	exit 1
fi

default_env_not_loaded_yet=1
