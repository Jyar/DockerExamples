FROM node:16-alpine as  builder
WORKDIR '/app'
COPY package.json . 
RUN npm install 
COPY . .
CMD ["npm", "run", "build"]
#/app/build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
#default command on nginx starts up nginx