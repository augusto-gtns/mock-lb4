FROM node:10-slim
USER node

RUN mkdir -p /home/node/app
WORKDIR /home/node/app

# Install app dependencies
COPY --chown=node package*.json ./
RUN npm install

# Bundle app source code
COPY --chown=node . .
RUN npm run build

CMD [ "node", "." ]
