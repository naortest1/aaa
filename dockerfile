FROM node:12-alpine		
ARG AUTH_TOKEN		
WORKDIR /node/app		

RUN npm config set @argonsecurity:registry=https://npm.pkg.github.com/		
RUN npm config set //npm.pkg.github.com/:_authToken=${AUTH_TOKEN}		

COPY package.json .		
COPY yarn.lock .		
COPY src ./src		
COPY tsconfig.json .		

run apk upgrade		

ADD . .


RUN yarn && yarn run build		

CMD [ "node", "build/index.js"]
