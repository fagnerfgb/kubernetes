FROM node:22.14.0-alpine3.21
EXPOSE 8080
LABEL author="Fagner Geraldes Braga"
LABEL contact="fagner.fgb@gmail.com"
WORKDIR /app
COPY --chown=node:node package*.json .
RUN npm install
COPY --chown=node:node . .
ENTRYPOINT [ "node", "server.js" ]
USER node