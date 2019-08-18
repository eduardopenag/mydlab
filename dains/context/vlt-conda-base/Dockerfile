# version 4.5.12 of miniconda (latest as of april 2019) is actually based on python 3.5
FROM continuumio/miniconda3:4.5.12
ADD spec-file.txt ./

RUN apt-get update
RUN apt-get install subversion subversion-tools -y

RUN useradd jovyan
RUN groupadd --gid 300 vlt
RUN usermod -g 300 jovyan
RUN mkdir /home/jovyan
RUN chown jovyan /home/jovyan

RUN conda create --name VLT --file spec-file.txt
RUN conda create --name datalab --clone VLT

RUN conda update --name datalab --all

CMD /bin/bash
