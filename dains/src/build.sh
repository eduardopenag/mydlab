#!/bin/bash

# who        when        what
# ---------  ----------  ----------------------------------------------
# epena      2019-08-03  Extensions installation added
# jgil       2019-05-24  created
#

# Check all requierements needed to install a particular DataLab 
# Depend on: DataLab environment variables
# Note: This scrip run after: ???_env.sh 


[ "$default_env_not_loaded_yet" = "" ] && source ./load_default_env.sh

# Fail on error
set -e



ifDebug set -x   # Show the command


# Prepare install dir
mkdir -p ../install/ 
cd ../install/

# Copy templates and other files
rsync -a ../templates/ .


rm -rf dlab_home/bin
mv dlab_home/datalab_bin dlab_home/bin

rsync -a ../docker-compose dlab_home/bin/
rsync -a ../context dlab_home/bin/docker-compose/
rsync -a ../proxy-config/user/ dlab_home/toolscfg/nginx/services/
rsync -a ../proxy-config/admin/ dlab_home/toolscfg/nginx_admin/services/

# epena
# EXTENSIONS 
for ex in "${extensions[@]}"; do 
    rsync -a ../../EXTENSIONS/$ex/templates/ .
    rsync -a ../../EXTENSIONS/$ex/docker-compose dlab_home/bin/
    rsync -a ../../EXTENSIONS/$ex/context dlab_home/bin/docker-compose/
    rsync -a ../../EXTENSIONS/$ex/proxy-config/ dlab_home/toolscfg/nginx/services/
done

# Replace DLAB_ variables. All of them. For free.
DLAB_VARS=${!DLAB_*}

ifDebug set +x   # Hide the command

debug "In $(pwd) ..."


for dlab_key in $DLAB_VARS; do
	dlab_value=${!dlab_key}

	echo "export $dlab_key=$dlab_value" >> dlab_home/bin/datalab_envs.sh

	# +e to ignore grep errors on zero found values
	set +e


	files=$(grep -rIl $dlab_key *)

	# -e to restore Fail ON ERROR
	set -e

	if [[ "$files" != "" ]]; then
		echo "Replacing \$$dlab_key\$=$dlab_value in $(echo $files | wc -w) files."

		# ifDebug set -x   # Show the command
		for f in $files; do

			# https://thoughtbot.com/blog/sed-102-replace-in-place
			(
				# Replace $DLAB_VARNAME$ with its content.
				sed -i.DELETEME 's|\$'$dlab_key'\$|'$dlab_value'|g' $f
				rm $f.DELETEME
				debug "$dlab_key -> $dlab_value in $f"
				ifDebug grep $dlab_key $f
			# In parallel!
			) &

		done
		wait
		# ifDebug set +x   # Hide the command
		
	fi
done


# HACK for pl10 install
#if [[ "$DLAB_NODES" == "pl10" ]]; then
#	ifDebug set -x
#	echo "TESTBENCH: pl10 special configs."
#	mv dlab_home/toolscfg/es-6.3.2/elasticsearch-pl10.yml dlab_home/toolscfg/es-6.3.2/elasticsearch.yml
#	ifDebug set +x
#fi



debug "FINISHED $0"
