#!/bin/bash

# who        when        what
# ---------  ----------  ----------------------------------------------
# epena      2019-04-17  created
#

# Configuration for the Paranal testbench at pl10

export DLAB_NAME=pl10dev


# Where is going to be installed
export DLAB_NODES=pl10
export DLAB_HOME=/data/distributed
export DLAB_LOCAL=/data/local
export DLAB_FASTLOCAL=/data/local
export DLAB_BACKUPS=/data/backup

export DLAB_USER=dlabmgr

export DLAB_DOMAIN_LONG=devdatalab.pl.eso.org
export DLAB_DOMAIN_SHORT=devdatalab

export DLAB_ELASTICNAME=datalab-es


# What is going to be installed
#extensions=(paranal es_hot_warm jupyter_ml)

# Services stacks

# Stacks set 0: registry
stacks+=(dc_registry.yml)
# The resgistry browser is optional
export DLAB_registry_browser_replicas=1

# Stacks set 1: Core: ldap + proxy + admin
stacks+=(dc_ldap.yml dc_proxy.yml dc_admin.yml)

## LDAP web admin tool is optional
export DLAB_phpldapadmin_replicas=1

## Admin optional services: viz
export DLAB_viz_replicas=1

# Probably portiner and jupyter admin are not optionals. TBC
export DLAB_portainer_replicas=1
export DLAB_jupyter_admin_replicas=1

# Stacks set 2: Databases and its intefaces
tacks+=(dc_elassandra.yml)
export DLAB_cassandra_daemon=Elassandra  # use Cassandra for Cassandra only
export DLAB_elassandra_ES_http_port=9200
export DLAB_elassandra_ES_transport_port=9300

stacks+=(dc_backend_interface.yml)
export DLAB_cerebro_replicas=1
export DLAB_kairosdb_replicas=1
export DLAB_prometheus_replicas=0

# Stacks set 3: User tools
stacks+=(dc_frontend.yml dc_jupyter.yml dc_jupyter_app.yml)
export DLAB_grafana_replicas=1
export DLAB_grafana_pg_replicas=1
export DLAB_kibana_replicas=1


#echo ${stacks[@]}

