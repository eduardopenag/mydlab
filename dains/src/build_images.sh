#!/bin/bash

[ "$default_env_not_loaded_yet" = "" ] && source ./load_default_env.sh

export PATH=$DLAB_HOME/bin:$PATH

dlab -v build all

debug "FINISHED $0"