proc abbreviate {phrase} {
    return [string toupper [join [lmap word [regexp -all -inline {[[:alpha:]][[:alpha:]']*} $phrase] {string range $word 0 0}] ""]]
}
