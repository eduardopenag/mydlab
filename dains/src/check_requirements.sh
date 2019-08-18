#!/bin/bash

# who        when        what
# ---------  ----------  ----------------------------------------------
# epena      2019-04-17  created
#

# Check all requierements needed to install a particular DataLab 
# Depend on: DataLab environment variables
# Note: This scrip run after: ???_env.sh 


[ "$default_env_not_loaded_yet" = "" ] && source ./load_default_env.sh

# Fail on error
set -e

ifNot() {
	if $1 
	then
		debug "Checked OK : $1"
	else
		echo "ERROR: $2"
		exit 1
	fi
}


printf  "Checking DLAB environment variables ...."

ifNot "[ -d $DLAB_HOME ]" "$DLAB_HOME don't exists"
ifNot "[ -w $DLAB_HOME ]" "$DLAB_HOME must be writtable"

ifNot "[ -d $DLAB_LOCAL ]" "$DLAB_LOCAL don't exists"
ifNot "[ -w $DLAB_LOCAL ]" "$DLAB_LOCAL must be writtable"

ifNot "[ -d $DLAB_FASTLOCAL ]" "$DLAB_FASTLOCAL don't exists"
ifNot "[ -w $DLAB_FASTLOCAL ]" "$DLAB_FASTLOCAL must be writtable"

ifNot "[ \"$DLAB_USER\" != '' ]"  "DLAB_USER must not be empty"

echo "OK!"



printf "Checking Docker environment .... ";  

debug "Checking Docker Swarm installed and initilized .... ";  
docker node ls

debug "Checking A docker privileged user account .... ";  
debug "Checking Docker insecure registry configured .... "; 

echo "(to be implemented)"

# printf "Checking free space .... ";  echo "(to be implemented)"


printf "Checking passwordless ssh between nodes .... ";  echo "(to be implemented)"
printf "Checking Common file system  .... ";  echo "(to be implemented)"
printf "Checking Elastic host modifications in place .... ";  echo "(to be implemented)"
printf "Checking /opt/anaconda3 installed in host machines .... ";  echo "(to be implemented)"



debug "FINISHED $0"