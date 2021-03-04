FROM python:3.9.1-buster

# For installing dependencies with requiring confirmation prompts
ARG DEBIAN_FRONTEND=noninteractive

# Install packages that are common dependencies for python packages
RUN apt-get update \
    && apt-get install -y \
        ca-certificates \
        git \
        mercurial \
        pkg-config \
        wget \
        build-essential \
        gcc \
        gettext \
        postgresql-client \
        libpq-dev \
        # For installing common Python cryptography package
        libssl-dev \
        libffi-dev \
        python3-dev \
        cargo

# Setup PYTHON environment variables to fix locale issues and logging speed
ENV LANG C.UTF-8

# Set Python output to be sent straight to the terminal
ENV PYTHONUNBUFFERED 1

# Expose port 8080 for serving HTTP traffic
EXPOSE 8080
ENV PORT 8080

# Upgrade and install virtualenv
RUN pip install --upgrade virtualenv
RUN python -m virtualenv /docker_venv
RUN /docker_venv/bin/pip3 install -U pip setuptools

# Install basic Django requirements
COPY requirements.txt /requirements.txt
RUN /docker_venv/bin/pip3 install -r /requirements.txt
RUN rm -f /requirements.txt
