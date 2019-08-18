#!/bin/bash

# who        when        what
# ---------  ----------  ----------------------------------------------
# epena      2019-06-11  created
#

# Generic configuration for a single node development DataLab
# ToDo: parametrize .pl.eo.org

export DLAB_NAME=devDlab

export DLAB_HOME=/data/distributed
export DLAB_USER=dlabmgr

export DLAB_DOMAIN_LONG=devdatalab.pl.eso.org
export DLAB_DOMAIN_SHORT=devdatalab

export DLAB_NODES=$(hostname)

export DLAB_LOCAL=/data/local
export DLAB_FASTLOCAL=/data/local

export DLAB_ELASTICNAME=datalab-es


export DLAB_USERID=$(id -u)
export DLAB_GROUPID=$(id -g)


