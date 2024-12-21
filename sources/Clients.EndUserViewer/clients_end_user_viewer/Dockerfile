# Use a lightweight image with Flutter pre-installed
FROM ghcr.io/cirruslabs/flutter:3.27.1 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the Flutter project files into the container
COPY . .

# Run Flutter clean to ensure a fresh build
RUN flutter clean

# Install dependencies
RUN flutter pub get

# Build the Flutter web app in release mode
RUN flutter build web --release

# Use an Nginx image to serve the Flutter web app
FROM nginx:alpine

# Copy the built Flutter web app from the build stage to the Nginx HTML directory
COPY --from=build /app/build/web /usr/share/nginx/html

# Expose the default Nginx port
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]