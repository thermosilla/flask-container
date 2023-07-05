FROM alpine:3.18
MAINTAINER Tomás Hermosilla "thermosilla@gmail.com"
RUN apk update && apk upgrade && apk add --update --no-cache python3 \
&& ln -sf python3 /usr/bin/python \
&& python -m ensurepip \
&& pip3 install --no-cache --upgrade pip setuptools \
&& addgroup appgroup \
&& adduser appuser -g appgroup -s /sbin/nologin -D \
&& mkdir /app \
&& chown -R appuser:appgroup /app
COPY requirements.txt ./app/requirements.txt
WORKDIR /app
RUN pip3 install -r requirements.txt
EXPOSE 5000

