#!/usr/bin/env bash

set -euo pipefail

main() {
    awk -f red-nosed-reports.awk red-nosed-reports.txt.sample
    #awk -f red-nosed-reports.awk red-nosed-reports.txt
}

main