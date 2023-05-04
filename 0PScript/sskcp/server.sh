#!/usr/bin/env bash

# env runner=podman sskcp_pswd=$pswd ./sskcp.sh

$runner run -d \
  --restart always \
  --name sskcp_server \
  -p 10818:6443 \
  -p 10808:6500/udp \
    mritd/shadowsocks \
      -m "ss-server" \
      -s " \
        -s 0.0.0.0 \
        -p 6443 \
        -m chacha20-ietf-poly1305 \
        -k $sskcp_pswd \
        " \
      -x \
      -e "kcpserver" \
      -k " \
        -t 127.0.0.1:6443 \
        -l :6500 \
        -mode fast2"
