# Use an official Node.js runtime as a base image
FROM node:21-alpine

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Compile TypeScript code
RUN npx tsc

# Expose the port that the application will run on
EXPOSE 80

# Command to run the application
CMD ["npm", "start"]

