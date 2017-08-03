FROM nginx:1.13.3

# Populate sources with closest neighbours
# Resolves issues with failing builds, should be removed in future
#RUN apt-get update \
#    && apt-get install -y netselect-apt \
#        --no-install-recommends --no-install-suggests \
#    && netselect-apt stretch \
#    && echo deb http://security.debian.org/debian-security stretch/updates main >> sources.list \
#    && mv sources.list /etc/apt/sources.list

# Install Node.js and other dependencies
RUN apt-get update \
    && apt-get install -y \
        curl \
        gnupg2 \
        build-essential \
      --no-install-recommends --no-install-suggests \
    && curl -sL https://deb.nodesource.com/setup_6.x | bash - \
    && apt-get install -y nodejs \
    && apt-get remove --purge -y gnupg2 && apt-get -y --purge autoremove \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
RUN npm install --global gulp-cli node-gyp
