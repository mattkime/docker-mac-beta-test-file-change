FROM node:6

RUN useradd --user-group --create-home --shell /bin/false matt

# copy app code to container
WORKDIR /home/matt/app
COPY . /home/matt/app
RUN chown -R matt:matt /home/matt/app

USER matt

WORKDIR /home/matt
COPY package.json /home/matt/package.json

ENV NODE_PATH=/home/matt/node_modules

RUN npm install --only=prod

WORKDIR /home/matt/app
CMD npm start
