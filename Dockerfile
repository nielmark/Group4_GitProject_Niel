FROM ubuntu:latest
WORKDIR /shift-scheduler
COPY . .
RUN chmod 777 -R /shift-scheduler
RUN apt update -y
RUN apt install -y gawk jq