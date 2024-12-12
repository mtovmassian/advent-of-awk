#!/usr/bin/env bash

set -euo pipefail

main() {
    local input_file="ceres-search.txt"
    awk -f ceres-search-pt2.awk "$input_file"

}

main