#!/usr/bin/env bash

set -euo pipefail

main() {
    local input_file="guard-gallivant.txt"
    awk -f guard-gallivant-pt1.awk "$input_file"
}

main