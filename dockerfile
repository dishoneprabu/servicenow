# Use the official Python image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the Python script to the container
COPY main.py /app/main.py

# Install Flask
RUN pip install flask

# Expose port 5000 (the default Flask port)
EXPOSE 5000

# Set environment variable for Flask to run in production mode
ENV FLASK_ENV=production

# Command to run the Flask application indefinitely
CMD ["sh", "-c", "while true; do python main.py; done"]
