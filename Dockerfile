FROM ubuntu:latest

WORKDIR /shift-scheduler

RUN apt-get update && \
    apt-get install -y bash coreutils ttyd gawk jq

COPY . .
RUN chmod 777 -R /shift-scheduler

CMD ["ttyd", "--writable", "-p", "8080", "bash"]