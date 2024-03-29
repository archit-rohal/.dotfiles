#!/bin/sh

# Thanks Francois, @fmarier
# https://feeding.cloud.geek.nz/posts/encoding-wifi-access-point-passwords-qr-code/

while getopts ":s:p:" _opt; do
  case "$_opt" in
    s) _ssid="$OPTARG" ;;
    p) _pass="$OPTARG" ;;
    *) echo "$0 [-s ssid] [-p pass]" ; exit 2 ;;
  esac
done

for _dep in feh qrencode; do
  if ! command -v "$_dep" >/dev/null 2>&1; then
    echo "$_dep required, not found, bye."
    exit 1
  fi
done

while [ -z "$_ssid" ]; do
  printf 'SSID: '
  read -r _ssid
done
stty -echo
while [ -z "$_pass" ]; do
  printf 'Password: '
  read -r _pass
done
printf '\n'
stty echo

qrencode -o - "WIFI:T:WPA;S:$_ssid;P:$_pass;;" | feh -

