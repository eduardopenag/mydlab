#!/bin/bash

# who        when        what
# ---------  ----------  ----------------------------------------------
# jgil       2019-05-28  created
#
#
# Load the instalation ENV values

[ "$default_env_not_loaded_yet" = "" ] && source ./load_default_env.sh

export PATH=$DLAB_HOME/bin:$PATH
