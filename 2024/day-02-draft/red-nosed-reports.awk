BEGIN { 
    SAFE_COUNT = 0;
    BAD_LEVEL_TOLERANCE = 1;  
}
{    

    i = 1
    direction = "none"
    while (i < NF) {
        cur_val = $i;
        next_val = $(i+1);
        distance = cur_val - next_val;

        if (distance == 0) {
            next;
        }
        if (distance > 3 || distance < -3) {
            next;
        }

        #if (direction == "none") {
        #    direction
        #}
        i++;
    }
    print $0;
    SAFE_COUNT += 1;
}
END { print SAFE_COUNT; }