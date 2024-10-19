Function Invoke-Etl() {
    <#
    .SYNOPSIS
    Transforms a set of legacy Lexiconia data stored as letters per score to a set of data stored score per letter.

    .DESCRIPTION
    Take a hash table and take the values as keys and the keys as values.

    .PARAMETER Legacy
    The legacy data to transform.

    .EXAMPLE
    Invoke-Etl -Legacy @{1 = @("A")}
    #>
    [CmdletBinding()]
    Param(
        [object]$Legacy
    )

    $Result = @{}
    foreach ($Key in $Legacy.PSBase.Keys) {
        foreach ($Letter in $Legacy[$Key]) {
            $Result[$Letter.ToLower()] = $Key
        }
    }
    $Result
}
