FROM node:10.19.0
ADD . /src
WORKDIR /src
RUN yarn install
RUN yarn run build-web
ENTRYPOINT ["cp", "--archive", "--no-target-directory", "--verbose", "build", "/mnt"]
