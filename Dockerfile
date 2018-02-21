FROM node:9-alpine

ENV PARSE_HOME /src
ENV NPM_CONFIG_LOGLEVEL error

ADD . $PARSE_HOME
WORKDIR $PARSE_HOME

RUN npm install \
 && npm run build \
 && npm cache clear --force \
 && rm -rf ~/.npm \
 && rm -rf /var/lib/apt/lists/*

ENV PORT 4040
EXPOSE $PORT

CMD ["npm", "run", "dashboard"]