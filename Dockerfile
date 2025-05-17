#BUILD PHASE CONFIG START

FROM node:alpine AS builder

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# BUILD PHASE CONFIG END

#RUN PHASE CONFIG START

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html

#RUN PHASE CONFIG END