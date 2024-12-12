#!/usr/bin/env bash

set -euo pipefail

main() {
  join \
    <(sort -n -k1 historian-hysteria.txt | awk '{print NR" "$1}') \
    <(sort -n -k2 historian-hysteria.txt | awk '{print NR" "$2}') \
  | awk '
    {
      distance = $3 > $2 ? $3 - $2 : $2 - $3
      total_distance += distance
    }
    END {print total_distance}
  '
}

main
