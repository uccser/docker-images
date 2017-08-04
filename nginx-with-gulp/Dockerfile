FROM nginx:1.13.3

# Install Node.js and other dependencies
RUN apt-get update \
    && apt-get install -y \
        gcc \
        curl \
        make \
        gnupg2 \
        python2.7 \
        pkg-config \
        build-essential \
        ca-certificates \
      --no-install-recommends --no-install-suggests \
    && curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -y nodejs \
    && apt-get remove --purge -y gnupg2 && apt-get -y --purge autoremove \
    && rm -rf /var/lib/apt/lists/*

ENV PYTHON=/usr/bin/python2.7

WORKDIR /app
RUN npm install --global gulp-cli node-gyp
