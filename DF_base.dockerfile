FROM gogost/gost as gost

FROM alpine:latest as task

RUN apk add --no-cache axel

RUN set -eux \
; mkdir -p ./Task \
; cd Task \
; axel https://kgithub.com/go-task/task/releases/download/v3.24.0/task_linux_amd64.tar.gz \
; tar xvf task_linux_amd64.tar.gz \
; mv task /usr/bin/task \
; cd .. \
; rm -rf ./Task

FROM alpine:latest

# add iptables for tun/tap
RUN apk add --no-cache iptables

WORKDIR /root

COPY --from=gost /bin/gost /usr/bin/gost
COPY --from=task /usr/bin/task /usr/bin/task
