#!/bin/bash
# + ------------------------------------------------------------------------- +
# ┏━┓┏━┓┏━┓╻┏ ┏━╸┏━┓ | Parker Oakes                                           +
# ┣━┛┃ ┃┣━┫┣┻┓┣╸ ┗━┓ | alan.p.oakes@gmail.com                                 +
# ╹  ┗━┛╹ ╹╹ ╹┗━╸┗━┛ | github.com/alanoakes | parkeroakes.io                  +
# + ------------------------------------------------------------------------- +
# File Description:
# Automate trouble tickets based on phase and project with timestamp
declare -i taId="$(task active | grep -o -E '[0-9]+' | head -n 1)"
taUUID="$(task _get ${taId}.uuid | head -c 8)"
taProjId="$(task _get ${taId}.tags)"
taDate="$(date +%Y%m%d%H%M)"
echo $taProjId$taUUID$taDate
