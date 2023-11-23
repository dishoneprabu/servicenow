# Use the official Python image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file to the container
COPY requirements.txt .

# Install dependencies, including Gunicorn
RUN pip install --no-cache-dir -r requirements.txt gunicorn

# Copy the Flask app code to the container
COPY app.py .

# Expose port 5000 (the default Flask port)
EXPOSE 5000

# Command to run the Flask app with Gunicorn
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "app:app"]
