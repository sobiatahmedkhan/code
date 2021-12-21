FROM node
COPY package.json  /
COPY . /
ENTRYPOINT ["node" , "index.js"]