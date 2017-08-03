FROM uccser/python:3.6.2-stretch

RUN apt-get update \
    && apt-get install -y \
        python-lxml \
        fontconfig \
        libcairo2 \
        libpango1.0-0 \
        libgdk-pixbuf2.0-0 \
        libffi-dev \
        shared-mime-info \
      --no-install-recommends --no-install-suggests \
    && apt-get -y --purge autoremove \
    && rm -rf /var/lib/apt/lists/*

# Install Weasyprint dependencies
RUN /docker_venv/bin/pip3 install -U pip setuptools
RUN /docker_venv/bin/pip3 install packaging==16.8
RUN /docker_venv/bin/pip3 install appdirs==1.4.3
RUN /docker_venv/bin/pip3 install html5lib==1.0b9
RUN /docker_venv/bin/pip3 install six==1.10.0
RUN /docker_venv/bin/pip3 install weasyprint==0.36
