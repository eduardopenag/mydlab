#!/bin/bash

# who        when        what
# ---------  ----------  ----------------------------------------------
# epena      2019-04-17  created
#

# Configuration for minimum DataLab
# Use this file as template for building other configurations
# e.g. production, test, mydatalab, macdatalab, armdatalab, etc. 

#####  CORE  ######

# If this variable is empty, the installation will fail.
export DLAB_HOME=


export DLAB_NAME=datalab

# Comma separated list of hosts (node1,node2)
export DLAB_NODES=localhost

export DLAB_LOCAL=/data/local


export DLAB_FASTLOCAL=

export DLAB_ELASTICNAME=defaultcluster

#export DLAB_SOURCES=$(pwd)/../..

# Owner of the DataLab (must have docker permission)
# export DLAB_USERID=$(id -u)
# export DLAB_GROUPID=$(id -g)

# DNS or /etc/hosts
#export DLAB_URL=mydatalab
#export DLAB_DOMAIN=example.com

# Registry
# local registry 1, remote registry 0
#export DLAB_LOCAL_REGISTRY=1
#export DLAB_REGISTRY_URL=mydatalab:5000

# LDAP auth
#export DLAB_LDAP=mydatalab
#export DLAB_ORGANISATION=TEST_ORG

# Proxy
#export DLAB_USERS_PORT=80
#export DLAB_ADMIN_PORT=81

