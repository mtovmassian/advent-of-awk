#!/usr/bin/env bash

set -euo pipefail

main() {
    grep -Eo "mul\([0-9]+,[0-9]+\)" mul-it-over.txt \
        | sed 's/[mul()]//g' \
        | awk -F',' '
            BEGIN {total=0;}
            {total += $1 * $2}
            END {print total}
        '
}

main