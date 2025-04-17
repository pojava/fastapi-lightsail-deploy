# syntax=docker/dockerfile:1

FROM python:3.9-slim

# Install dependencies
RUN apt-get update && \
    apt-get install -y nginx && \
    pip install --no-cache-dir fastapi uvicorn

# Create app directory
WORKDIR /app

# Copy application code
COPY ./app /app
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./app/static/index.html /usr/share/nginx/html/index.html

# Expose port
EXPOSE 80

# Start both Nginx and FastAPI
CMD bash -c "nginx && uvicorn main:app --host 0.0.0.0 --port 8000"
