FROM node:14-alpine

# Dependencies
# RUN apk update && apk upgrade && \
#    apk add --no-cache bash gawk sed grep bc coreutils git openssh

ENV NODE_ENV=production \
  MONGODB_URIX=mongodb://mongodb \
  COLLECTION=agendaJobs \
  PORT=8080
  BASE_PATH=/

RUN mkdir -p /agendash
WORKDIR /agendash

COPY package.json /agendash/
RUN npm install && npm cache clean --force

COPY . /agendash
RUN chmod +x /agendash/entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["/agendash/entrypoint.sh"]
