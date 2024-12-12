function quicksort(array, left, right) {
    if (left < right) {
        pivotIndex = partition(array, left, right)
        quicksort(array, left, pivotIndex - 1)
        quicksort(array, pivotIndex + 1, right)
    }
}

# Partition function for QuickSort
function partition(array, left, right, pivot, i, j, temp) {
    pivot = array[right]       # Choose the last element as the pivot
    i = left - 1               # i tracks the smaller elements
    for (j = left; j < right; j++) {
        rule_ = rules[array[j]"|"pivot]
        if (rule_ == "before") {
            i++
            # Swap array[i] and array[j]
            temp = array[i]
            array[i] = array[j]
            array[j] = temp
        }
    }
    # Swap array[i+1] and array[right] (pivot)
    temp = array[i + 1]
    array[i + 1] = array[right]
    array[right] = temp

    return i + 1               # Return the pivot index
}

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

    if (!is_valid) {
        quicksort(page_updates, 1, length(page_updates))
        # str = ""
        # for (i = 1; i <= length(page_updates); i++) {
        #     if (i == 1) {
        #         str = page_updates[i]
        #     } else {
        #         str = str","page_updates[i]
        #     }
  
        # }
        # printf "%s\n", str 
        middle = int((length(page_updates) + 1) / 2)
        total += page_updates[middle]
    }
}
END {
    print total
}