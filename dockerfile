FROM node:alpine as build

# Create directory for packages
RUN mkdir -p /usr/titaneum
WORKDIR /usr/titaneum

# Install dependancies
COPY package.json .

WORKDIR /usr/titaneum/packages/frontend
RUN npm install --silent

WORKDIR /usr/titaneum

RUN yarn start

# expose port 3000 and start application
EXPOSE 3000
CMD ["npm", "run", "start"]