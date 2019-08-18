FROM jupyter/base-notebook
ARG JUPYTERHUB_VERSION=0.9.4
RUN pip install --no-cache jupyterhub==$JUPYTERHUB_VERSION
RUN conda uninstall nbconvert
RUN pip install nbextensions==0.1.0
RUN pip install numpy==1.16.1
RUN pip install pandasticsearch==0.4.3
RUN pip install elasticsearch-dsl==6.3.1
RUN pip install fileupload==0.1.5
RUN jupyter nbextension install --sys-prefix --py fileupload
RUN jupyter nbextension enable --sys-prefix  --py fileupload
RUN pip install qgrid==1.1.1
RUN pip install papermill==0.18.1
RUN pip install ldap3==2.5.2
RUN pip install plotly==3.6.1
RUN pip install xlrd==1.2.0
RUN pip install Django==2.1.7
RUN pip install django-hardcopy==0.1.4
USER root
RUN apt-get update -y
RUN apt-get install chromium-browser -y
RUN apt-get install subversion -y
USER jovyan
RUN pip install pyppeteer==0.0.25
RUN pip install jupyter_contrib_nbextensions==0.5.1
#RUN pip install https://github.com/maartenbreddels/nbconvert/archive/widget_state.zip
RUN jupyter nbextension enable --py --sys-prefix qgrid
RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension
ADD jupyterhub_config.py /etc/jupyterhub/
ADD jupyter_notebook_config.py /etc/jupyter/
ADD nbextensions.tpl /opt/conda/lib/python3.7/site-packages/nbconvert/templates
RUN rm -rf /home/jovyan/work
RUN pip install passlib==1.7.1
RUN pip install openpyxl==2.6.2
CMD "start-singleuser.sh"
