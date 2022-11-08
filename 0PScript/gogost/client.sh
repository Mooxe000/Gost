#!/usr/bin/env bash

# env runner=podman gost_user=$user gost_pswd=$pswd remote_host=$host_ip ./gogost.sh

$runner run -d \
  --restart always \
  --name gost_client \
  -e user=$gost_user \
  -e pswd=$gost_pswd \
  -e kcp_port=14444 \
  -e tcp_port=14443 \
  -e remote_host=$remote_host \
  -e proxy_port=1080 \
  -p 1080:1080 \
  mooxe/gogost_client
