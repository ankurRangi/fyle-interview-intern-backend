# Python version 3.8
FROM python:3.8-slim
LABEL maintainer="ankurRangi"

# Working directory for docker image
WORKDIR /app

# Setting up environment variable to specify the entry point of your Flask application 
ENV FLASK_APP=core/server.py
ENV FLASK_ENV=development

# Copying the requirements file in docker app directory
COPY requirements.txt .

# Executing the Pip upgrading command with installing all the dependencies.
RUN pip install --upgrade pip && \
   pip install --no-cache-dir -r ./requirements.txt

COPY . .

# Resetting DB (Force remove - previous version of a file is deleted before creating a new one)
RUN rm -f core/store.sqlite3
RUN flask db upgrade -d core/migrations/

COPY . .
EXPOSE 5000
# When the container starts, it will run a Bash shell and execute the run.sh script.
CMD ["flask", "run", "--host=0.0.0.0"]

