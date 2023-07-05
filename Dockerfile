FROM alpine:3.18
MAINTAINER Tomás Hermosilla "thermosilla@gmail.com"
RUN apk update && apk upgrade && apk add --update --no-cache python3 
RUN ln -sf python3 /usr/bin/python 
RUN python -m ensurepip 
RUN pip3 install --no-cache --upgrade pip setuptools 
RUN addgroup appgroup 
RUN adduser appuser -g appgroup -s /sbin/nologin -D 
RUN mkdir /app 
RUN chown -R appuser:appgroup /app
COPY requirements.txt ./app/requirements.txt
USER appuser
WORKDIR /app
RUN pip3 install -r requirements.txt
EXPOSE 5000

