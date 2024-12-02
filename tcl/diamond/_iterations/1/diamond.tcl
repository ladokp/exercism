proc diamond {letter} {
    # ASCII value of 'A' and the input letter
    set A 65
    set letterVal [scan $letter %c]
    set size [expr {$letterVal - $A + 1}]

    # Create diamond rows
    set rows {}
    for {set i 0} {$i < $size} {incr i} {
        set char [format %c [expr {$A + $i}]]
        set spacesLeft [string repeat " " [expr {$size - $i - 1}]]
        if {$i == 0} {
            # Only one character in the first row
            set line "$spacesLeft$char$spacesLeft"
        } else {
            # Middle spaces between same characters
            set middleSpaces [string repeat " " [expr {2 * $i - 1}]]
            set line "$spacesLeft$char$middleSpaces$char$spacesLeft"
        }
        lappend rows $line
    }

    # Mirror the top half to form the full diamond
    set diamond [concat $rows [lreverse [lrange $rows 0 end-1]]]
    return [join $diamond \n]
}
