# Use the official Node.js image as the base image
FROM node:latest

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to WORKDIR
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all files from the current directory to WORKDIR (including server.js)
COPY . .

# Expose the port on which the app runs
EXPOSE 3000

# Command to run the application
CMD ["node", "index.js"]
