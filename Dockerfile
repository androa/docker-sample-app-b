# Based on the Official Node image. Highly recommend to bind it the desired
# major version.
FROM node:latest

WORKDIR /usr/src/app

# Ensure the local node user owns the app folder
RUN chown -R node:node /usr/src/app
USER node

# Add the local node_modules/.bin to PATH
ENV PATH "/usr/src/app/node_modules/.bin:$PATH"

# Set NODE_ENV as a build argument. This creates different build layers and
# images. It also sets it as a environment variable, making npm/yarn to run
# installation in production mode (i.e. no devDependencies)
ARG NODE_ENV
ENV NODE_ENV=$NODE_ENV PORT=3000

# Adding package.json first will create a separated build layer in Docker that
# can be cached independently from your source code. This utilizes the docker
# build cache for faster builds.
COPY package.json package-lock.json /usr/src/app/
RUN npm install

COPY . /usr/src/app/

EXPOSE $PORT

CMD [ "npm", "start" ]
