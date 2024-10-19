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

    $Array = $Array | Sort-Object
    $start = -1
    $end = $Array.Length
    $count = 0
    
    while ($end -gt $start + 1) {
        [int]$index = ($start + $end) / 2
        if ($Value -lt $Array[$index]) { $end = $index }
        elseif ($Value -gt $Array[$index]) { $start = $index }
        elseif ($Value -eq $Array[$index]) { return $index }
        $count++
    }
    throw "error: value not in array"
}
