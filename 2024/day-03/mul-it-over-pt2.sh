#!/usr/bin/env bash

set -euo pipefail

main() {
    grep -Eo "(do\(\)|don't\(\)|mul\([0-9]+,[0-9]+\))" mul-it-over.txt \
        | sed 's/[mul()]//g' \
        | awk -F',' '
            BEGIN { do_mul = 1; total=0; }
            $1 ~ "don'\''t" { do_mul = 0; next; }
            $1 == "do" { do_mul = 1; next; }
            {
                if (do_mul) {
                    total += $1 * $2
                } else {
                    next
                }
            }
            END {print total}
        '
}

main