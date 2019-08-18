#!/bin/bash

# who        when        what
# ---------  ----------  ----------------------------------------------
# jgil       2019-05-28  created
#

# Transfer the files in ../install into DATALAB 
# Write a better description here please.


[ "$default_env_not_loaded_yet" = "" ] && source ./load_default_env.sh


# Fail on error
set -e
set -x   # Show the command

cd ../install

rsync -aO dlab_home/ $DLAB_HOME/
rsync -aO local/ $DLAB_LOCAL/
rsync -aO fastlocal/ $DLAB_FASTLOCAL/
rsync -aO --ignore-existing dlab_home_defaults/ $DLAB_HOME/

# Fix BIN permissions
#find $DLAB_HOME/bin/ -type f | xargs chmod a-x
chmod a+x $DLAB_HOME/bin/dlab

set +x   # Show the command
echo "PENDING: default data files here, rsync --ignore-existing dlab_home_defaults $DLAB_HOME/"


if ! grep "$DLAB_HOME/bin" ~/.bash_profile; then

LINES="$(cat << EOF
# Added by DATALAB
export PATH=$DLAB_HOME/bin:\$PATH
EOF
)"

	echo -e "\n\nIMPORTANT!!! The following lines were added to your .bash_profile"
	echo "--------------------------------------------------" 
	echo -e "$LINES"
	echo "--------------------------------------------------" 

	echo >> ~/.bash_profile
	echo -e "$LINES" >> ~/.bash_profile
fi

echo "DATALAB files installed in $DLAB_HOME."


debug "FINISHED $0"
