# reference: https://hub.docker.com/_/ubuntu/
FROM ubuntu:16.04

# Adds metadata to the image as a key value pair example LABEL version="1.0"
LABEL maintainer="dapper tayra"

##Set environment variables
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

RUN apt-get update --fix-missing && apt-get install -y wget bzip2 ca-certificates \
    build-essential \
    byobu \
    curl \
    git-core \
    htop \
    pkg-config \
    python3-dev \
    python3-pip \
    python-setuptools \
    python-virtualenv \
    unzip \
    && \
apt-get clean && \
rm -rf /var/lib/apt/lists/*

ADD . /setup
WORKDIR /setup
RUN chmod +x start_jupyter.sh
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --upgrade -r "/setup/requirements.txt"
RUN jupyter contrib nbextension install
RUN jupyter nbextension enable collapsible_headings/main

# Open Ports for Jupyter
EXPOSE 8888

# Run a shell script
CMD ["bash", "start_jupyter.sh"]

