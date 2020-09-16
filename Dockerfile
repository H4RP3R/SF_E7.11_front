FROM node:lts-alpine as build-stage
WORKDIR /app
COPY ./SF_E7.11_front/package*.json ./
RUN npm install
COPY ./SF_E7.11_front/ .
RUN npm run build


FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
RUN rm /etc/nginx/conf.d/default.conf
COPY ./SF_E7.11_front/nginx/nginx.conf /etc/nginx/conf.d
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
