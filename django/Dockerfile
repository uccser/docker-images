FROM uccser/python:3.6.2-stretch

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y \
        gcc \
        gettext \
        mysql-client \
        default-libmysqlclient-dev \
        postgresql-client \
        libpq-dev \
        sqlite3 \
      --no-install-recommends --no-install-suggests \
    && apt-get -y --purge autoremove \
    && rm -rf /var/lib/apt/lists/*

ENV DJANGO_VERSION 1.11.4

COPY requirements.txt /requirements.txt
RUN /docker_venv/bin/pip3 install -r /requirements.txt
RUN rm -f /requirements.txt