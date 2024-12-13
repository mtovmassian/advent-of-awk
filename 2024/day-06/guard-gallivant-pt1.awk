function turn_90deg() {
    cur_loc = map[cur_loc_y][cur_loc_x]
    if (cur_loc == north) { map[cur_loc_y][cur_loc_x] = east; return 1; }
    if (cur_loc == east) { map[cur_loc_y][cur_loc_x] = south; return 1; }
    if (cur_loc == south) { map[cur_loc_y][cur_loc_x] = west; return 1; }
    if (cur_loc == west) { map[cur_loc_y][cur_loc_x] = north; return 1; }
}

function move() {
    cur_loc = map[cur_loc_y][cur_loc_x]
    if (cur_loc == north) {
        next_loc_y = cur_loc_y - 1
        next_loc_x = cur_loc_x
    }
    if (cur_loc == east) {
        next_loc_y = cur_loc_y
        next_loc_x = cur_loc_x + 1
    }
    if (cur_loc == south) {
        next_loc_y = cur_loc_y + 1
        next_loc_x = cur_loc_x
    }
    if (cur_loc == west) {
        next_loc_y = cur_loc_y
        next_loc_x = cur_loc_x - 1
    }

    next_loc = map[next_loc_y][next_loc_x]
    if (next_loc != "#") {
        map[next_loc_y][next_loc_x] = cur_loc
        map[cur_loc_y][cur_loc_x] = "X"
        cur_loc_y = next_loc_y
        cur_loc_x = next_loc_x
    } else {
        turn_90deg()
        move()
    }
}

function is_within_map_bounds() {
    if ((cur_loc_y >= 1 && cur_loc_y <= map_height) && (cur_loc_x >= 1 && cur_loc_x <= map_width)) { 
        return 1
    }
    return 0
}

function count_visited_positions() {
    visited_positions = 0
    for (y = 1; y <= map_height; y++) {
        for (x = 1; x <= map_width; x++) {
            if (map[y][x] == "X") {
                visited_positions += 1
            }
        }
    } 
    return visited_positions
}

function print_map() {
    for (y = 1; y <= map_height; y++) {
        str = ""
        for (x = 1; x <= map_width; x++) {
            str = str""map[y][x]
        }
        print str
    } 
}

BEGIN {
    FS = ""
    map[1][1] = "."
    map_width = 1
    map_height = 1
    cur_loc_x = 1
    cur_loc_y = 1
    north = "^"
    east = ">"
    south = "v"
    west = "<"
}
{
    map[NR][1] = ""
    map_width = NF
    map_height = NR
    for (i = 1; i <= NF; i++) {
        map[NR][i] = $i

        if ($i == north || $i == east || $i == south || $i == west) {
            cur_loc_x = i
            cur_loc_y = NR
        }
    }

}
END {
    while (is_within_map_bounds()) {
        move()
    }
    #print_map()
    #print "last location: x= "cur_loc_x" y="cur_loc_y
    print count_visited_positions()
}