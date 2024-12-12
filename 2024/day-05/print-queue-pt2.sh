#!/usr/bin/env bash

set -euo pipefail

main() {
    local input_file="print-queue.txt"
    
    #awk -f print-queue-pt2.awk <(sed -n '1,26p;26q' "$input_file")
    awk -f print-queue-pt2.awk "$input_file"
}

main