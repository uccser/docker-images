FROM ghcr.io/uccser/django:2.2.18

# For installing dependencies with requiring confirmation prompts
ARG DEBIAN_FRONTEND=noninteractive

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

# Install WeasyPrint into virtualenv
COPY requirements.txt /requirements.txt
RUN /docker_venv/bin/pip3 install -r /requirements.txt
RUN rm -f /requirements.txt
