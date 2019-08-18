FROM jupyter/datascience-notebook:a238993ad594

USER root
RUN apt-get update && apt-get -yq install --reinstall curl libxtst6
RUN apt-get -yq install --reinstall xdg-utils
RUN apt-get -yq install --reinstall subversion

# LibreOffice format conversion utility
RUN apt-get -yq install --reinstall unoconv

# JupyterLab extensions
ENV NODE_OPTIONS=--max-old-space-size=4096

USER $NB_UID

RUN /opt/conda/bin/conda install --yes -c conda-forge \
      sqlalchemy tornado jinja2 traitlets requests pip pycurl \
      nodejs configurable-http-proxy && \
    /opt/conda/bin/pip install --upgrade pip

ADD ./requirements.txt requirements.txt
RUN pip install -r requirements.txt

# nb extensions
RUN conda install -c conda-forge jupyter_contrib_nbextensions

# nb extensions configuration menu
RUN pip install jupyter_nbextensions_configurator
RUN jupyter nbextensions_configurator enable

# appmode
RUN conda install --channel conda-forge appmode

# probably not needed
RUN pip install appmode
RUN jupyter nbextension     enable --py --sys-prefix appmode
RUN jupyter serverextension enable --py --sys-prefix appmode

# install pivot tables
RUN pip install pivottablejs

RUN pip install nbpresent
#RUN jupyter nbextension install nbpresent --py --overwrite
RUN jupyter nbextension enable nbpresent --py
RUN jupyter serverextension enable nbpresent --py

# Plots rendering. Mandatory
#RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager@0.34
USER root

# not sure if the following line is needed
RUN jupyter contrib nbextension install --system

# Graphviz
RUN conda install --quiet --yes -c anaconda graphviz
RUN jupyter labextension install @jupyterlab/plotly-extension
RUN jupyter labextension install jupyterlab_bokeh
RUN jupyter labextension install qgrid
RUN pip install jupyterlab_latex
RUN jupyter serverextension enable --sys-prefix jupyterlab_latex
RUN jupyter labextension install @jupyterlab/latex


RUN pip install jupyterlab_iframe
RUN jupyter labextension install jupyterlab_iframe
RUN jupyter serverextension enable --py --sys-prefix jupyterlab_iframe
RUN pip install perspective-python
RUN jupyter labextension install @jpmorganchase/perspective-jupyterlab

RUN pip install bqplot
RUN jupyter labextension install bqplot
RUN jupyter labextension install @jupyterlab/statusbar
#RUN jupyter labextension install jupyterlab-drawio
#RUN conda install -c ales-erjavec orange3
#RUN jupyter labextension install @mflevine/jupyterlab_html
RUN conda install -c conda-forge nbtutor
RUN pip install opencv-contrib-python

USER $NB_UID
RUN pip install lolviz
RUN pip install callgraph

# resource usage
RUN pip install nbresuse
RUN jupyter serverextension enable --py nbresuse

#RUN pip install jupyterlab-discovery


#######################
# modules under evaluation (these modules should be moved to requirements.txt)

RUN pip install papermill
RUN pip install howdoi
RUN pip install newspaper3k
RUN pip install pyyaml

RUN pip install import-ipynb

#RUN pip install inferpy
#RUN pip install causal-impact
#RUN pip install causalinference
#RUN pip install causality
#RUN pip install cdt


RUN pip install pyd3netviz

RUN conda install -c conda-forge rise
RUN pip install labella

RUN pip install --upgrade pixiedust

RUN pip install jupyter-wysiwyg
#RUN jupyter nbextension install --py jupyter_wysiwyg

RUN jupyter nbextension enable --py jupyter_wysiwyg

RUN conda install -c conda-forge tqdm

RUN pip install git+https://github.com/NII-cloud-operation/Jupyter-multi_outputs
RUN pip install --upgrade watermark

RUN pip install --upgrade weplot
RUN pip install --upgrade chartify

#RUN pip install --upgrade svn


USER root
#RUN pip install --system --upgrade ipyaggrid
#RUN jupyter nbextension enable --py --sys-prefix ipyaggrid
#RUN jupyter labextension install ipyaggrid

#RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager

#RUN  conda install -c conda-forge ipyvolume

RUN conda install -c conda-forge itkwidgets
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager itk-jupyter-widgets

#RUN pip install ipywidgets
#RUN jupyter nbextension enable --py widgetsnbextension
RUN pip install lineup_widget
RUN jupyter nbextension enable --py --sys-prefix lineup_widget

RUN pip install --upgrade clustergrammer_widget
RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension
RUN jupyter nbextension enable --py --sys-prefix clustergrammer_widget

#RUN conda install -c conda-forge nodejs
#RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager
#RUN jupyter labextension install jupyter-threejs

RUN conda install -c genepattern nbtools
RUN conda install -c conda-forge voila
#RUN pip install --upgrade jugri
#RUN pip install --upgrade gremlinpython

RUN pip install --upgrade fileupload
RUN jupyter nbextension install --system --py fileupload
RUN jupyter nbextension enable --system --py fileupload

RUN pip install --upgrade flatten_json
RUN pip install --upgrade docxtpl
RUN pip install --upgrade nbdime
RUN pip install --upgrade nbstripout


USER root

# Jupyter (and csv, json, etc) to sqllite
RUN pip install --upgrade sqlitebiter

# Jupyter notebooks search
RUN pip install git+https://github.com/conery/nbscan.git

# not working
#RUN pip install --upgrade  nb-mermaid
#RUN pip install --upgrade graphviz2drawio

# Drawio-batch
RUN npm install commander --save
RUN npm install -g puppeteer --unsafe-perm=true --allow-root
RUN git clone https://github.com/languitar/drawio-batch.git && \
    cd drawio-batch && \
    npm -g install

RUN pip install jupyterhub==0.9.3

#COPY drawio exec to /opt/anaconda/bin?

RUN jupyter lab build
USER $NB_UID

COPY .jupyter $HOME

EXPOSE 8888 8866 6006 3012
