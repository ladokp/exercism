Function Invoke-BinarySearch() {
    <#
    .SYNOPSIS
    Perform a binary search on a sorted array.

    .DESCRIPTION
    Take an array of integers and a search value and return the index of the value in the array.

    .PARAMETER Array
    The array to search.

    .PARAMETER Value
    The value to search for.

    .EXAMPLE
    Invoke-BinarySearch -Array @(1, 2, 3, 4, 5) -Value 3
    #>
    [CmdletBinding()]
    Param(
        [Int64[]]$Array,
        [Int64]$Value
    )

    begin {
        $Array = $Array | Sort-Object
    }

    process {
        $start = -1
        $end = $Array.Length
        $count = 0

        while ($end -gt $start + 1) {
            [int]$i = ($start + $end) / 2
            if ($Value -lt $Array[$i]) {
                $end = $i
            }
            elseif ($Value -gt $Array[$i]) {
                $start = $i
            }
            elseif ($Value -eq $Array[$i]) {
                return $i
            }
            $count++
        }
        throw "error: value not in array"
    }

    end {

    }
}
