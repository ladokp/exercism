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
    foreach ($Character in $Phrase.ToLower().ToCharArray()) {
        if ("abcdefghijklmnopqrstuvwxyz".Contains("$Character") -eq $false -or $ContainedCharacters.Contains("$Character") -eq $false) { $ContainedCharacters += "$Character"}
    }
    ($ContainedCharacters -join "") -eq $Phrase
}
