#!/usr/bin/env bash

set -euo pipefail

transpose_cols_to_rows() {
    local input_file="$1"
    awk '                 
    BEGIN {FS=""} { 
        for (i=1; i<=NF; i++)  {
            a[NR,i] = $i
        }
    }
    NF>p { p = NF }
    END {    
        for(j=1; j<=p; j++) {
            str=a[1,j]
            for(i=2; i<=NR; i++){
                str=str""a[i,j];
            }
            print str
        }
    }
    ' "$input_file"
}

transpose_diagonals() {
    local input_file="$1"
    awk '
    BEGIN {FS=""}
    {
        for (i = 1; i <= NF; i++) {
            diag[NR + i - 1] = diag[NR + i - 1] $i
        }
    }
    END {
        for (i in diag) {
            print diag[i]
        }
    }
    ' "$input_file"
}

transpose_anti_diagonals() {
    local input_file="$1"
    awk '
    BEGIN {FS=""}
    {
        for (i = 1; i <= NF; i++) {
            diag[i - NR] = diag[i - NR] $i
        }
    }
    END {
        for (i in diag) {
            print diag[i]
        }
    }
    ' "$input_file"
}

main() {
    local input_file="ceres-search.txt"

    grep -Eo 'XMAS' "$input_file"
    grep -Eo 'SAMX' "$input_file"

    grep -Eo 'XMAS' <(transpose_cols_to_rows "$input_file")
    grep -Eo 'SAMX' <(transpose_cols_to_rows "$input_file")

    grep -Eo 'XMAS' <(transpose_diagonals "$input_file")
    grep -Eo 'SAMX' <(transpose_diagonals "$input_file")

    grep -Eo 'XMAS' <(transpose_anti_diagonals "$input_file")
    grep -Eo 'SAMX' <(transpose_anti_diagonals "$input_file")
}

main