#!/bin/sh

get_cpu_usage() {
  cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
  echo "[  $cpu_usage% ]"
}

echo "$(get_cpu_usage)"
