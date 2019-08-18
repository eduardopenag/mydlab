# -----------------------------------------------------
# ------ THIS FILE WAS AUTOMATICALLY GENERATED --------
# -----------------------------------------------------
# ---- Modify it in the source, then install again.----
# -----------------------------------------------------



# -----------------------------------------------------
# ----------------- Common Library --------------------
# -----------------------------------------------------

set -e

    # IMAGES="$(ls -1 docker-compose/*.yml | grep -v registry)"
    # for img in $IMAGES; do
    #     deploy $(basename $img | sed -e 's/dc_//g' -e 's/.yml//g' )
    # done
    # The stack name is inferred from dc_XXX.yml name, and is ${DLAB_ELASTICNAME}-XXX.

get_local_services() {
	echo "cassandra elassandra elastic"
}
get_stack_services() {
	SERV=""
	stacks="$(ls -1 docker-compose/*.yml | 
		egrep -v "($(get_local_services | tr " " "|" ))")"
	for d in $stacks; do
		SERV="$SERV $(basename $d | sed -e 's/dc_//g' -e 's/.yml//g')"
	done
	echo $SERV
}
exitMsg() { echo "# $(date) --- FATAL ---"; echo -e "$@"; exit 1; }
debug()   {  ifDebug echo -e "# $(date +%Y-%m-%dT%H:%M:%S)@$HOSTNAME:\t$(echo "$@" | tr "\n" " ")" ; }
cmd()     { debug "$@"; $@; }
ifDebug() { if [[ "$DEBUG" != "" ]]; then $@ ; fi; }
usage()   { echo -e "$USAGE"; exit 1; }
verbose() { 
	if [[ "$VERBOSE" == "1" ]]; then
		echo -e "$(date +%Y-%m-%dT%H:%M:%S)  $(echo "$@" | tr "\n" " ")" ; 
	fi
}

dryExec() {
	if [[ "$DRYMODE" == "1" ]]; then
		echo -e "# $@"
	else
	    ifDebug set -x
		$@
	    set +x
	fi
}

create_lock_file() {
	SUBJECT=dlab-$(basename $0)
	LOCK_FILE=/tmp/$SUBJECT.lock

	debug "Creating LOCK_FILE=$LOCK_FILE"

	if [ -f "$LOCK_FILE" ]; then
	   echo "Script is already running: $LOCK_FILE"
	   exit
	fi

	# trap "debug \"Removing $LOCK_FILE\"; rm -f $LOCK_FILE" EXIT
	trap "remove_lock_file" EXIT
	touch $LOCK_FILE	
}

remove_lock_file() {
	debug "Removing $LOCK_FILE"
	rm -f $LOCK_FILE
}

# -----------------------------------------------------
# ----------------- Option Parsing --------------------
# -----------------------------------------------------

VERBOSE=
QUIET=
DRYMODE=
ORIGINAL_PARAMS=

# http://www.wassen.net/parsing-command-line-parameters.html
# Look that URL if need optional parameter , like c:: -c 10
while getopts vhnd PARAM; do
    ORIGINAL_PARAMS="$ORIGINAL_PARAMS -$(echo -n $PARAM)"
    case "$PARAM" in
        d)
            DEBUG=1
            ;;
        v)
            VERBOSE=1
            ;;
        n)
            DRYMODE=1
            ;;
        h)
            usage; exit 0
            ;;
    esac
done

# additional free arguments:
shift $(( OPTIND - 1))

debug "VERBOSE          = $VERBOSE"
debug "DRYMODE          = $DRYMODE"
debug "DEBUG            = $DEBUG"
debug "ORIGINAL_PARAMS  = $ORIGINAL_PARAMS"
debug "FREE PARAMS ($#) = $@"




# -----------------------------------------------------
# --------- SPECIFIC FOR THIS INSTALLATION ------------
# -----------------------------------------------------

