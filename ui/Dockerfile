## Stage 1: Builder
FROM node:10-alpine as builder

# Copy the package.json to install dependencies
COPY ./skydive-ui/package.json ./skydive-ui/package-lock.json ./

# Install the dependencies and make the folder
RUN npm install && mkdir /webui && mv ./node_modules /webui

# Working on /webui
WORKDIR /webui

# Copy code to /webui directory
COPY ./skydive-ui .

# Build the project and copy the files
RUN npm run build

#-----------------------------------------------------------

## Stage 2: Start app
FROM nginx:alpine

# Remove default nginx index page
RUN rm -rf /usr/share/nginx/html/*

# Copy from the stage 1
COPY --from=builder /webui/dist /usr/share/nginx/html/

# Start nginx server
CMD ["nginx", "-g", "daemon off;"]
