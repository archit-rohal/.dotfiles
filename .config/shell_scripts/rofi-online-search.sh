#!/usr/bin/env bash

export LC_ALL=C.UTF-8

set -x
query="$(rofi -dmenu -p "search > ")"

search_engines=('gg:https://www.google.com/search?q=^'
  'gi:https://images.google.com/search?q=^'
  'ddg:https://duckduckgo.com/?q=^')

__magic () {
  _ss="$(printf '%s\n' "$1" | sed 's/ /%20/g')" # transforms "string": ' ' -> %20
  printf '%s\n' "$2" | sed "s/\^/$_ss/"
}

__transform () {
  _query_prefix="${1%%:*}" # we grab the prefix, such as 'gg'
  for _engine in ${search_engines[@]}; do
    _se_prefix="${_engine%%:*}"
    if [[ "$_se_prefix" == "$_query_prefix" ]]; then
      __magic "${1#*:}" "${_engine#*:}"
      return
    fi
  done
  # Default to Google if no matching prefix is found
  __magic "$1" "https://www.google.com/search?q=^"
}

"${BROWSER:-xdg-open}" "$(__transform "$query")"
