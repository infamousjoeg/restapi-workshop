FROM node:12

WORKDIR /home/node/mdx-deck
RUN chown node:node /home/node/mdx-deck

USER node
COPY package*.json ./
RUN npm install && npm audit fix

EXPOSE 8000

CMD npm start