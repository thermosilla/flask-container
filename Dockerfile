FROM ubuntu:latest
MAINTAINER Tomás Hermosilla "thermosilla@gmail.com"
RUN apt update -y && apt install -y python3-pip python3-dev libpq-dev
COPY requirements.txt ./app/requirements.txt
WORKDIR /app
RUN pip install -r requirements.txt
EXPOSE 5000
ENTRYPOINT ["gunicorn"  , "--bind", "0.0.0.0:5000", "wsgi:app"]

