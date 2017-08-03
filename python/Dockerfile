FROM python:3.6.2-stretch

# Install packages that are common dependencies for python packages
RUN apt-get update \
    && apt-get install -y \
        ca-certificates \
        git \
        mercurial \
        pkg-config \
        wget \
        build-essential \
        libcurl4-openssl-dev \
        libffi-dev \
        libjpeg-dev \
        default-libmysqlclient-dev \
        libpng-dev \
        libpq-dev \
        libssl-dev \
        libxml2-dev \
        libxslt1-dev \
        swig \
        zlib1g-dev \
        gfortran \
        libatlas-dev \
        libblas-dev \
        libfreetype6-dev \
        liblapack-dev \
        libquadmath0 \
        libmemcached-dev \
        libsasl2-2 \
        libsasl2-dev \
        libsasl2-modules \
        sasl2-bin \
        python-cffi \
      --no-install-recommends --no-install-suggests \
    && apt-get -y --purge autoremove \
    && rm -rf /var/lib/apt/lists/*

# Setup PYTHON environment variables to fix locale issues and logging speed
ENV LANG C.UTF-8
ENV PYTHONUNBUFFERED 1

# Upgrade and install virtualenv
RUN pip install --upgrade virtualenv
RUN python -m virtualenv --python=python3.6 /docker_venv

# Port 8080 is used by Google App Engine for serving HTTP traffic
EXPOSE 8080
ENV PORT 8080

# The user's Dockerfile must specify an entrypoint with ENTRYPOINT or CMD
CMD []
