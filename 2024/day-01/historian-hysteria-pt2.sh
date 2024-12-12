#!/usr/bin/env bash

set -euo pipefail

main() {
  awk -f historian-hysteria-pt2.awk historian-hysteria.txt
}

main
