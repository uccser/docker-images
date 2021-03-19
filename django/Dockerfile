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

# Install WeasyPrint dependencies
RUN apt-get update \
    && apt-get install -y \
        python3-dev \
        python3-pip \
        python3-setuptools \
        python3-wheel \
        python3-cffi \
        libcairo2 \
        libpango-1.0-0 \
        libpangocairo-1.0-0 \
        libgdk-pixbuf2.0-0 \
        libffi-dev \
        shared-mime-info

# Setup PYTHON environment variables to fix locale issues and logging speed
ENV LANG C.UTF-8

# Set Python output to be sent straight to the terminal
ENV PYTHONUNBUFFERED 1

# Expose port 8080 for serving HTTP traffic
EXPOSE 8080
ENV PORT 8080

# Create non-root user and set working directory
RUN groupadd --gid 1000 uccser && useradd --uid 1000 --gid uccser --shell /bin/bash --create-home uccser
RUN mkdir /app && chown -R uccser:uccser /app
RUN mkdir /docker_venv && chown -R uccser:uccser /docker_venv
WORKDIR /app
USER uccser

# Upgrade and install virtualenv
RUN pip install --upgrade virtualenv
RUN python -m virtualenv /docker_venv
RUN /docker_venv/bin/pip3 install -U pip setuptools

# Install Python dependencies into virtualenv
COPY --chown=uccser:uccser requirements.txt requirements.txt
RUN /docker_venv/bin/pip3 install -r requirements.txt
RUN rm requirements.txt
