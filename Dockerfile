# Use a Node.js version compatible with the requirements
FROM node:18.17.0

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and pnpm-lock.yaml into the container
COPY package.json pnpm-lock.yaml ./

# Install pnpm globally
RUN npm install -g pnpm@9.6.0

# Copy the patches folder if it exists (avoids missing file errors)
COPY patches ./patches

# Install dependencies
RUN pnpm install --frozen-lockfile

# Copy the rest of the application code into the container
COPY . ./

# Build the application (if needed for your use case)
RUN pnpm run build

# Expose the port the application runs on
EXPOSE 5678

# Specify the command to run the application
CMD ["pnpm", "start"]
