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

    $Protein = @()
    :StrandLoop for ($index = 0; $index -lt $Strand.Length; $index += 3) {
        if ($index + 3 -gt $Strand.Length) { throw "error: Invalid codon" }
        switch ($Strand.Substring($index, 3)) {
            "AUG" { $Protein += "Methionine" }
            "UUU" { $Protein += "Phenylalanine" }
            "UUC" { $Protein += "Phenylalanine" }
            "UUA" { $Protein += "Leucine" }
            "UUG" { $Protein += "Leucine" }
            "UCU" { $Protein += "Serine" }
            "UCC" { $Protein += "Serine" }
            "UCA" { $Protein += "Serine" }
            "UCG" { $Protein += "Serine" }
            "UAU" { $Protein += "Tyrosine" }
            "UAC" { $Protein += "Tyrosine" }
            "UGU" { $Protein += "Cysteine" }
            "UGC" { $Protein += "Cysteine" }
            "UGG" { $Protein += "Tryptophan" }
            "UAA" { break StrandLoop }
            "UAG" { break StrandLoop }
            "UGA" { break StrandLoop }
            default { throw "error: Invalid codon" }
        }
    }
    $Protein
}
