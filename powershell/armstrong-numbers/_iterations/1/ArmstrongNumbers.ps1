Function Invoke-ArmstrongNumbers() {
    <#
    .SYNOPSIS
    Determine if a number is an Armstrong number.

    .DESCRIPTION
    An Armstrong number is a number that is the sum of its own digits each raised to the power of the number of digits.

    .PARAMETER Number
    The number to check.

    .EXAMPLE
    Invoke-ArmstrongNumbers -Number 12
    #>
    [CmdletBinding()]
    Param(
        [Int64]$Number
    )

    $Digits = [Math]::Floor([Math]::Log10($Number) + 1)
    $DigitBase = $Number
    while ($DigitBase -gt 0) {
        $CalculatedNumber += [Math]::Pow($DigitBase % 10, $Digits)
		$DigitBase = [Math]::Floor($DigitBase / 10)
    }
    [Math]::Floor($CalculatedNumber) -eq $Number
}
