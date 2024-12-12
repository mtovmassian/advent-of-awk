#!/usr/bin/env bash

set -euo pipefail

main() {
    local input_file="print-queue.txt"
    
    #awk -f print-queue-pt1.awk <(sed -n '1,28p;28q' "$input_file")
    awk -f print-queue-pt1.awk "$input_file"
}

main