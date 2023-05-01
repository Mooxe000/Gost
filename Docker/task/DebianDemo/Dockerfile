FROM debian:bullseye-slim

RUN cp /etc/apt/sources.list /etc/apt/sources.list.bk \
;   cat /etc/apt/sources.list.bk \
|   sed -e '/^#/d' \
|   sed -e 's/deb.debian.org/mirrors.aliyun.com/g' \
>   /etc/apt/sources.list

RUN apt-get update \
;   apt-get upgrade -y

RUN apt-get install -y wget axel gzip

WORKDIR /root

ADD ./task.sh /root

RUN chmod +x ./task.sh \
;   ./task.sh \
;   rm -rf ./task.sh
