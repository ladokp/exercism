Function Invoke-Anagram() {
    <#
    .SYNOPSIS
    Determine if a word is an anagram of other words in a list.

    .DESCRIPTION
    An anagram is a word formed by rearranging the letters of another word, e.g., spar, formed from rasp.
    Given a word and a list of possible anagrams, find the anagrams in the list.

    .PARAMETER Subject
    The word to check

    .PARAMETER Candidates
    The list of possible anagrams

    .EXAMPLE
    Invoke-Anagram -Subject "listen" -Candidates @("enlists" "google" "inlets" "banana")
    #>
    [CmdletBinding()]
    Param(
        [string]$Subject,
        [string[]]$Candidates
    )

    $sortedTarget = ($Subject.ToLower().ToCharArray() | Sort-Object) -join ""
    $Anagrams = @()

    foreach ($Candidate in $Candidates) {
        $sortedCandidate = ($candidate.ToLower().ToCharArray() | Sort-Object) -join ""
        if ($sortedTarget -eq $sortedCandidate -and $Subject.ToLower() -ne             $Candidate.ToLower()) {
            $Anagrams += $Candidate
        }
    }
    return $Anagrams
}
