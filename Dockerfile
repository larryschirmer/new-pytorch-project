FROM ubuntu:21.04
RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y wget


RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -b -p /miniconda
ENV PATH=/miniconda/bin:$PATH
COPY packages packages


RUN conda env create -f packages/environment_pytorch.yml
SHELL ["conda","run","-n","pytorch","/bin/bash","-c"]
RUN python -m ipykernel install --name pytorch --display-name "PyTorch"

RUN rm -rf packages
RUN rm Miniconda3-latest-Linux-x86_64.sh


RUN mkdir /code
WORKDIR /code

EXPOSE 8888
