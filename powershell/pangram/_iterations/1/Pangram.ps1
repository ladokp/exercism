Function Invoke-Panagram() {
    <#
    .SYNOPSIS
    Determine if a sentence is a pangram.
    
    .DESCRIPTION
    A pangram is a sentence using every letter of the alphabet at least once.
    
    .PARAMETER Sentence
    The sentence to check
    
    .EXAMPLE
    Invoke-Panagram -Sentence "The quick brown fox jumps over the lazy dog"
    
    Retuns: $true
    #>
    [CmdletBinding()]
    Param(
        [string]$Sentence
    )

    $LowerAlphabet = "abcdefghijklmnopqrstuvwxyz"
    $ContainedCharacters = @()
    foreach ($Character in $Sentence.ToLower().ToCharArray()) {
        if ($ContainedCharacters.Contains("$Character")) { continue }
        if ($LowerAlphabet.Contains("$Character")) { $ContainedCharacters += "$Character"}
    }
    (($ContainedCharacters | Sort-Object) -join "") -eq $LowerAlphabet
}
