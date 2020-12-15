#!/usr/bin/env bash
# + ------------------------------------------------------------------------- +
# ┏━┓┏━┓┏━┓╻┏ ┏━╸┏━┓ | Parker Oakes                                           +
# ┣━┛┃ ┃┣━┫┣┻┓┣╸ ┗━┓ | alan.p.oakes@gmail.com                                 +
# ╹  ┗━┛╹ ╹╹ ╹┗━╸┗━┛ | github.com/alanoakes | parkeroakes.io                  +
# + ------------------------------------------------------------------------- +
# File Description:
# Generate Randomized Project ID Numbers with timestamp for Data Security
ProjDate="P$(date +%Y%m%d%H)-"
Proj=""
until [ ${#Proj} -eq '10' ]; do
  for x in $(echo {a..z}$(shuf -i 1-10 -r -n 1) | tr -d '\n' | tr -d ' '); do
    for y in ${x:$((RANDOM%52+1)):1}; do
      Proj="$Proj$y"
    done
  done
done
echo "$ProjDate$Proj"
