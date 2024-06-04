# Python version 3.8
FROM python:3.8
LABEL maintainer="ankurRangi"

# Working directory for docker image
WORKDIR /app

# Setting up environment variable to specify the entry point of your Flask application 
# which contains the APP instance app = Flask(__name__)
ENV FLASK_APP=core/server.py
ENV PIP_ROOT_USER_ACTION=ignore
ENV PORT 5000

# Copying the requirements file in docker app directory
COPY ./requirements.txt /app

# Executing the Pip upgrading command with installing all the dependencies.
RUN pip install --upgrade pip && \
   pip install -r ./requirements.txt
   # Resetting DB (Force remove - previous version of a file is deleted before creating a new one)
   # rm -f core/store.sqlite3

COPY . .

EXPOSE $PORT
# When the container starts, it will run a Bash shell and execute the run.sh script.
CMD ["flask", "run"]

