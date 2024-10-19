#!/usr/bin/env tclsh

proc isLeapYear {year} {
    expr {  $year %   4 == 0 && 
          ( $year % 100 != 0 ||
            $year % 400 == 0 )
         }
}
