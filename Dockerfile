ARG NODE_VERSION=21.1.0

FROM node:${NODE_VERSION}-alpine

# Use production node environment by default.
ENV NODE_ENV production

# Set the working directory inside the container.
WORKDIR /app

# Copy package.json and package-lock.json to the working directory.
COPY package*.json ./

# Install all dependencies (both dependencies and devDependencies).
RUN npm install

# Copy the rest of the source files into the image.
COPY . .

# Build the TypeScript files.
RUN npm run build

# Expose the port that the application listens on.
EXPOSE 8080

# Run the application using nodemon.
CMD ["npm", "run", "dev"]
