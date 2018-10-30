FROM nginx:1.15.5

# Install Node.js and other dependencies
RUN apt-get update \
    && apt-get install -y \
        build-essential \
        ca-certificates \
        curl \
        fonts-liberation \
        gcc \
        gconf-service \
        git \
        gnupg2 \
        libappindicator1 \
        libasound2 \
        libatk1.0-0 \
        libc6 \
        libcairo2 \
        libcairo2-dev \
        libcups2 \
        libdbus-1-3 \
        libexpat1 \
        libfontconfig1 \
        libgcc1 \
        libgconf-2-4 \
        libgdk-pixbuf2.0-0 \
        libgif-dev \
        libglib2.0-0 \
        libgtk-3-0 \
        libjpeg-dev \
        libnspr4 \
        libnss3 \
        libpango-1.0-0 \
        libpango1.0-dev \
        libpangocairo-1.0-0 \
        libssl-dev \
        libstdc++6 \
        libx11-6 \
        libx11-xcb1 \
        libxcb1 \
        libxcomposite1 \
        libxcursor1 \
        libxdamage1 \
        libxext6 \
        libxfixes3 \
        libxi6 \
        libxrandr2 \
        libxrender1 \
        libxss1 \
        libxtst6 \
        lsb-release \
        make \
        pkg-config \
        python2.7 \
        wget \
        xdg-utils \
      --no-install-recommends --no-install-suggests \
    && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y nodejs \
    && apt-get remove --purge -y gnupg2 && apt-get -y --purge autoremove \
    && rm -rf /var/lib/apt/lists/*

ENV PYTHON=/usr/bin/python2.7

WORKDIR /app
RUN npm install --global gulp-cli node-gyp
