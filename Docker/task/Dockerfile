FROM alpine:latest

RUN apk add --no-cache bash axel

WORKDIR /root

ADD ./task.sh /root

RUN chmod +x ./task.sh \
;   ./task.sh \
;   rm -rf ./task.sh
