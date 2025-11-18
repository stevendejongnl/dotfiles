#!/usr/bin/env bash
set -euo pipefail

pkill barrier &
sleep 2
barrier --no-tray --server &

sleep 2

pkill scream &
sleep 2
scream -o pulse -i enp2s0 &

