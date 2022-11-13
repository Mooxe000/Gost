#!/usr/bin/env bash

# env runner=podman sskcp_host=$host_ip sskcp_pswd=$pswd ./client.sh

$runner run -d \
  --name sskcp_client \
  --restart=always \
  -p 1080:1080 \
  mritd/shadowsocks \
    -m "ss-local" \
    -s " \
      -s 127.0.0.1 \
      -p 10808 \
      -b 0.0.0.0 \
      -l 1080 \
      -m chacha20-ietf-poly1305 \
      -k $sskcp_pswd \
      " \
    -x -e "kcpclient" \
    -k " \
      -r $sskcp_host:10808 \
      -l :10808 \
      -mode fast2 \
    "
