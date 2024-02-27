# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Install development tools and dependencies
RUN apt-get update && \
    apt-get install -y build-essential libcairo2-dev pkg-config && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Set environment variable for Django
ENV DJANGO_SETTINGS_MODULE=horilla.settings

# Run app.py when the container launches
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
