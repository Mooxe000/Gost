#!/usr/bin/env bash

# env runner=podman gost_user=$user gost_pswd=$pswd ./gogosh.sh

$runner run -d \
  --restart=always \
  --name gost_server \
  -e user=$gost_user \
  -e pswd=$gost_pswd \
  -e kcp_port=14444 \
  -e tcp_port=14443 \
  -p 14444:14444/udp \
  -p 14443:14443 \
  mooxe/gogost_server
