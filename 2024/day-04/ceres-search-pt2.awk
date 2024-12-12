BEGIN {FS=""; total = 0}
{
    for (i = 1; i <= NF; i++) {
        lines[NR, i] = $i    # Store each word using a composite key (line, field)
    }
}
END {
    for (i = 1; i <= NR; i++) {
        for (j = 1; j <= NF; j++) {
            char1 = lines[i, j]
            char2 = lines[i, j+2]
            charx = lines[i+1, j+1]
            char11= lines[i+2, j]
            char22 = lines[i+2, j+2]
            if (char1 == "M" && char2 == "S") {
                if (charx == "A" && char11 == "M" && char22 == "S") {
                    # print(i)
                    total += 1
                }
            }
            if (char1 == "S" && char2 == "M") {
                if (charx == "A" && char11 == "S" && char22 == "M") {
                    # print(i)
                    total += 1
                }
            }
            if (char1 == "M" && char2 == "M") {
                if (charx == "A" && char11 == "S" && char22 == "S") {
                    # print(i)
                    total += 1
                }
            }
            if (char1 == "S" && char2 == "S") {
                if (charx == "A" && char11 == "M" && char22 == "M") {
                    # print(i)
                    total += 1
                }
            }
        }
    }
    print total
}