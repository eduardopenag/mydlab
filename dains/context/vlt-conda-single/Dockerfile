FROM $DLAB_DOMAIN_SHORT$:5000/vlt-conda-base
SHELL ["/bin/bash", "-c"]

USER root

RUN apt-get install libhdf5-serial-dev hdf5-tools -y

RUN conda install --name datalab -c conda-forge jupyterhub==0.9.2
RUN conda install --name datalab -c conda-forge jupyter_contrib_nbextensions
RUN conda install --name datalab -c conda-forge jupyterlab

RUN conda install --name datalab -c plotly plotly
RUN conda install --name datalab -c bokeh bokeh
RUN conda install --name datalab -c conda-forge altair
RUN conda install --name datalab -c conda-forge pandas
RUN conda install --name datalab -c conda-forge elasticsearch
RUN conda install --name datalab -c conda-forge elasticsearch-dsl
RUN conda install --name datalab -c conda-forge papermill
RUN conda install --name datalab -c conda-forge ldap3
RUN conda install --name datalab -c conda-forge passlib
RUN conda install --name datalab -c conda-forge qgrid
RUN conda install --name datalab -c conda-forge jupytext

RUN conda install --name datalab -c conda-forge rise
RUN conda install --name datalab -c conda-forge python-cufflinks
RUN conda install --name datalab --force -c conda-forge h5py
RUN conda install --name datalab -c astropy astroplan
RUN conda update --name datalab scipy

RUN conda install -c genepattern jupyter-wysiwyg

RUN source activate datalab && jupyter lab build

USER jovyan
WORKDIR /home/jovyan
CMD source activate datalab && jupyterhub-singleuser --ip 0.0.0.0 --hub-api-url http://jupyterhub:8081/hub/api
