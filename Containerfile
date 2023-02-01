FROM docker.io/debian:11.3
LABEL authors="Kosmas Hench" \
      description="Container to ship the repeat masking program"

# setting up conda
RUN apt update && apt install -y build-essential cmake xjobs git wget procps
RUN mkdir -p /manual_install/bin && \
    cd /manual_install && \
    git clone https://github.com/baoxingsong/dCNS.git && \
    cd dCNS && \
    cmake ./ && \
    make

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-py39_4.12.0-Linux-x86_64.sh && \
    bash Miniconda3-py39_4.12.0-Linux-x86_64.sh -b -p /miniconda

ENV PATH ${PATH}:/miniconda/bin

RUN conda install mamba -y -n base -c conda-forge

COPY env.yml /
RUN mamba env create -f /env.yml && conda clean -a

ENV PATH ${PATH}:/miniconda/envs/dCNS-0.1/bin:/manual_install/dCNS
