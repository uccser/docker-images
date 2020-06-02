FROM python:3.8.3-buster

# Install packages that are common dependencies for python packages
RUN apt-get update \
    && apt-get install -y \
        ca-certificates \
        git \
        mercurial \
        pkg-config \
        wget \
        build-essential \
      --no-install-recommends --no-install-suggests \
    && apt-get -y --purge autoremove \
    && rm -rf /var/lib/apt/lists/*

# Setup PYTHON environment variables to fix locale issues and logging speed
ENV LANG C.UTF-8
ENV PYTHONUNBUFFERED 1

# Upgrade and install virtualenv
RUN pip install --upgrade virtualenv
RUN python -m virtualenv --python=python3.8 /docker_venv
RUN /docker_venv/bin/pip3 install -U pip setuptools

# Port 8080 is used by Google App Engine for serving HTTP traffic
EXPOSE 8080
ENV PORT 8080

# The user's Dockerfile must specify an entrypoint with ENTRYPOINT or CMD
CMD []
