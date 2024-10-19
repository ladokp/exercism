$Codons = @{
    "AUG" = "Methionine";
    "UUU" = "Phenylalanine";
    "UUC" = "Phenylalanine";
    "UUA" = "Leucine";
    "UUG" = "Leucine";
    "UCU" = "Serine";
    "UCC" = "Serine";
    "UCA" = "Serine";
    "UCG" = "Serine";
    "UAU" = "Tyrosine";
    "UAC" = "Tyrosine";
    "UGU" = "Cysteine";
    "UGC" = "Cysteine";
    "UGG" = "Tryptophan";
    "UAA" = "STOP";
    "UAG" = "STOP";
    "UGA" = "STOP";
}

Function Invoke-ProteinTranslation() {
    <#
    .SYNOPSIS
    Translate RNA sequences into proteins.

    .DESCRIPTION
    Take an RNA sequence and convert it into condons and then into the name of the proteins in the form of a list.

    .PARAMETER Strand
    The RNA sequence to translate.

    .EXAMPLE
    Invoke-ProteinTranslation -Strand "AUG"
    #>
    [CmdletBinding()]
    Param(
        [string]$Strand
    )

    $protein = @()
    :StrandLoop for ($index = 0; $index -lt $Strand.Length; $index += 3) {
        if ($index + 3 -gt $Strand.Length) { throw "error: Invalid codon" }
        switch ($Strand.Substring($index, 3)) {
            "AUG" { $protein += "Methionine" }
            "UUU" { $protein += "Phenylalanine" }
            "UUC" { $protein += "Phenylalanine" }
            "UUA" { $protein += "Leucine" }
            "UUG" { $protein += "Leucine" }
            "UCU" { $protein += "Serine" }
            "UCC" { $protein += "Serine" }
            "UCA" { $protein += "Serine" }
            "UCG" { $protein += "Serine" }
            "UAU" { $protein += "Tyrosine" }
            "UAC" { $protein += "Tyrosine" }
            "UGU" { $protein += "Cysteine" }
            "UGC" { $protein += "Cysteine" }
            "UGG" { $protein += "Tryptophan" }
            "UAA" { break StrandLoop }
            "UAG" { break StrandLoop }
            "UGA" { break StrandLoop }
            default { throw "error: Invalid codon" }
        }
    }
    return $protein
}
