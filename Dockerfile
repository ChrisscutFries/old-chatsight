# Use an appropriate base image, e.g., python:3.10-slim
FROM public.ecr.aws/lambda/python:3.9

# Set environment variables (e.g., set Python to run in unbuffered mode)
COPY requirements.txt .
RUN pip install -r requirements.txt -t /var/task/

# Set the working directory
WORKDIR /app

# Copy your application's requirements and install them
COPY requirements.txt /app/

RUN pip install -r /app/requirements.txt

# Copy your application code into the container
COPY . /app/

EXPOSE 8080

CMD ["python", "-m", "chainlit", "run", "app.py", "-h", "--port", "8080"]