Function Invoke-Isogram() {
    <#
    .SYNOPSIS
    Determine if a word or phrase is an isogram.
    
    .DESCRIPTION
    An isogram (also known as a "nonpattern word") is a word or phrase without a repeating letter,
    however spaces and hyphens are allowed to appear multiple times.
    
    
    .PARAMETER Phrase
    The DNA strand to count
    
    .EXAMPLE
    Invoke-Isogram -Phrase "isogram"
    
    Retuns: $true
    #>
    [CmdletBinding()]
    Param(
        [string]$Phrase
    )

    $ContainedCharacters = @()
    $Phrase.ToLower().ToCharArray() | ForEach-Object {
        if ("abcdefghijklmnopqrstuvwxyz".Contains("$_") -eq $false -or $ContainedCharacters.Contains("$_") -eq $false) { $ContainedCharacters += "$_"}
    }
    ($ContainedCharacters -join "") -eq $Phrase
}
