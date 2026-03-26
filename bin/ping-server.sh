#!/usr/bin/env bash
HOST="${1:?Usage: ping-server.sh <host> [name] [interval] [notify_interval]}"
NAME="${2:-$HOST}"
INTERVAL="${3:-5}"
NOTIFY_INTERVAL="${4:-600}" # 10 minutes

last_notify=0

while true; do
  if ping -c 1 -W 2 "$HOST" &>/dev/null; then
    notify-send -u critical "$NAME is BACK ONLINE" "$HOST is responding to ping"
    echo "$(date): $HOST is back online!"
    exit 0
  fi

  now=$(date +%s)
  if (( now - last_notify >= NOTIFY_INTERVAL )); then
    notify-send -u normal "$NAME still down" "$HOST not responding"
    echo "$(date): $HOST still not responding..."
    last_notify=$now
  fi

  sleep "$INTERVAL"
done
