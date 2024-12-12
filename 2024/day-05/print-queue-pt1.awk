$0 ~ /^[0-9]+\|[0-9]+$/ { 
    split($0, rule, "|")
    rules[rule[1]"|"rule[2]] = "before"
    rules[rule[2]"|"rule[1]] = "after"
}
$0 ~ /^[0-9]+,/ {
    is_valid = 1
    split($0, page_updates, ",")
    #print $0
    for (i = 1; i <= length(page_updates); i++) {
        if (i > 1) {
            for (j = 1; j < i; j++) {
                #print "check if " page_updates[i] " is after " page_updates[j]
                if (rules[page_updates[i]"|"page_updates[j]] == "before") {
                    is_valid = 0
                    break
                }
            }
        }
        if (i < length(page_updates)) {
            for (j = i + 1; j <= length(page_updates); j++) {
                #print "check if " page_updates[i] " is before " page_updates[j]
                if (rules[page_updates[i]"|"page_updates[j]] == "after") {
                    is_valid = 0
                    break
                }
            }
        }
    }
    if (is_valid) {
        #print $0
        middle = int((length(page_updates) + 1) / 2)
        #print page_updates[middle]
        total += page_updates[middle]
    }
}
END {
    print total
}