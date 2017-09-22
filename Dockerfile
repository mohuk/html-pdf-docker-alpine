FROM node:8.5.0-alpine
RUN apk update
RUN apk add --no-cache fontconfig curl
RUN mkdir -p /usr/share
RUN cd /usr/share
RUN curl -L https://github.com/Overbryd/docker-phantomjs-alpine/releases/download/2.11/phantomjs-alpine-x86_64.tar.bz2 | tar xj
RUN ln -s /usr/share/phantomjs/phantomjs /usr/bin/phantomjs

RUN mkdir -p /app

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install

COPY . ./

ENTRYPOINT ["node"]
