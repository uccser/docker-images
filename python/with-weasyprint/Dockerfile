FROM uccser/python:buster-3.8.3-python

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
        shared-mime-info \
      --no-install-recommends --no-install-suggests \
    && apt-get -y --purge autoremove \
    && rm -rf /var/lib/apt/lists/*

# Install Weasyprint dependencies
COPY requirements.txt /requirements.txt
COPY pip-install.sh /pip-install.sh
RUN chmod +x /pip-install.sh
RUN /pip-install.sh /docker_venv/bin/pip3 /requirements.txt

# Remove extra files
RUN rm -f /requirements.txt
RUN rm -f /pip-install.sh
