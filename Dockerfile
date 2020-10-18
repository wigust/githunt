FROM node:10.19.0
ADD . /src
WORKDIR /src
RUN yarn install
RUN yarn run build-web
ENTRYPOINT ["yarn", "start"]
