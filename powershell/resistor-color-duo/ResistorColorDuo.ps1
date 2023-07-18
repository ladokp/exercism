Function Get-ColorCode() {
    <#
    .SYNOPSIS
    Translate a color to its corresponding color code.

    .DESCRIPTION
    Given a color, return its corresponding color code.

    .PARAMETER Color
    The color to translate to its corresponding color code.

    .EXAMPLE
    Get-ColorCode -Color "black"
    #>
    [CmdletBinding()]
    Param(
        [string]$Color
    )
    
    @{
        'black' = 0
        'brown' = 1
        'red' = 2
        'orange' = 3
        'yellow' = 4
        'green' = 5
        'blue' = 6
        'violet' = 7
        'grey' = 8
        'white' = 9
    }[$Color]
}

Function Get-ColorCodeValue() {
    <#
    .SYNOPSIS
    Translate a list of colors to their corresponding color code values.

    .DESCRIPTION
    Given 2 colors, take the first one and times it by 10 and add the second color to it.

    .PARAMETER Colors
    The colors to translate to their corresponding color codes.

    .EXAMPLE
    Get-ColorCodeValue -Colors @("black", "brown")
    #>
    [CmdletBinding()]
    Param(
        [string[]]$Colors
    )
    
    (Get-ColorCode -Color $Colors[0]) * 10 + (Get-ColorCode -Color $Colors[1])
}
