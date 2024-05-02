#!/bin/sh

get_memory_usage() {
  memory_info=$(free -h | grep Mem)
  swap_info=$(free -h | grep Swap)
  total=$(echo "$memory_info" | awk '{print $2}')
  used=$(echo "$memory_info" | awk '{print $3}')
  # percentage=$(echo "$memory_info" | awk '{print $3/$2 * 100}')
  swap=$(echo "$swap_info" | awk '{print $3}')
  
  echo "[  $used/$total - $swap ]"
}

echo "$(get_memory_usage)"
