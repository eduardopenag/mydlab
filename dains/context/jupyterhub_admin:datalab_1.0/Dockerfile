FROM jupyterhub/jupyterhub:1.0.0

RUN pip install jupyterhub-ldapauthenticator
RUN pip install dockerspawner==0.10.0

RUN pip install jupyter

# Creating container user $DLAB_USER$/ for spawning processes
#RUN adduser --quiet --disabled-password --shell /bin/bash --home /home/$DLAB_USER$/ --gecos "" --uid $DLAB_USERID$ $DLAB_USER$
RUN adduser --quiet --disabled-password --shell /bin/bash --home /home/$DLAB_USER$/ --gecos "" --uid $DLAB_USERID$ dlabmgr

# Docker defaults
ENV CRONICLE_base_app_url 'http://localhost:3012'
ENV CRONICLE_WebServer__http_port 3012
ENV CRONICLE_WebServer__https_port 443
ENV CRONICLE_web_socket_use_hostnames 1
ENV CRONICLE_server_comm_use_hostnames 1
ENV CRONICLE_web_direct_connect 0
ENV CRONICLE_socker_io_transports '["polling", "websocket"]'

RUN apt-get update && apt-get -yq install --reinstall git curl wget perl tar procps gnupg2 subversion rsync

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install --reinstall -yq nodejs

# Install Wizzy in order to manage Grafana deploymnets
RUN npm install -g wizzy


RUN        mkdir -p /opt/cronicle

WORKDIR    /opt/cronicle/

RUN        mkdir -p data logs plugins

RUN        curl -L "https://github.com/jhuckaby/Cronicle/archive/v0.8.28.tar.gz" | tar zxvf - --strip-components 1 && \
           npm install && \
           node bin/build.js dist

RUN apt-get install libhdf5-serial-dev hdf5-tools -y

RUN conda install  -c conda-forge jupyter_contrib_nbextensions
RUN conda install  -c conda-forge jupyterlab

RUN conda install  -c plotly plotly
RUN conda install  -c bokeh bokeh
RUN conda install  -c conda-forge altair
RUN conda install  -c conda-forge pandas
RUN conda install  -c conda-forge elasticsearch
RUN conda install  -c conda-forge elasticsearch-dsl
RUN conda install  -c conda-forge papermill
RUN conda install  -c conda-forge ldap3
RUN conda install  -c conda-forge passlib
RUN conda install  -c conda-forge qgrid
RUN conda install  -c conda-forge jupytext

RUN conda install  -c conda-forge rise
RUN conda install  -c conda-forge python-cufflinks
RUN conda install  --force -c conda-forge h5py
RUN conda install  -c astropy astroplan
#RUN conda update  scipy

RUN jupyter labextension install @jupyterlab/toc
RUN jupyter labextension install @jupyterlab/github
RUN conda install -c genepattern jupyter-wysiwyg
RUN conda install -c conda-forge ipysheet
RUN jupyter labextension install ipysheet
RUN jupyter nbextension enable --py --sys-prefix ipysheet
#RUN jupyter labextension install jupyterlab_voyager

RUN conda install -c conda-forge voila
RUN conda install --channel conda-forge appmode

RUN conda install -c genepattern jupyter-wysiwyg

#RUN conda install -c conda-forge ipywidgets
RUN pip install "ipywidgets==7.5.1"
RUN conda install -c conda-forge nodejs
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager


RUN jupyterhub upgrade-db
RUN jupyter lab build

#RUN curl https://rclone.org/install.sh | sudo bash

ADD        entrypoint.sh /entrypoint.sh

EXPOSE     3012 8888 8866

# data volume is also configured in entrypoint.sh
VOLUME     ["/opt/cronicle/data", "/opt/cronicle/logs", "/opt/cronicle/plugins"]

WORKDIR /home/$DLAB_USER$/
CMD     ["sh", "/entrypoint.sh"]


