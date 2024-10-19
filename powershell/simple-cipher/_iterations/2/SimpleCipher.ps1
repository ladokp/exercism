<#
.SYNOPSIS
Implement a simple shift cipher like Caesar and a more secure substitution cipher.

.DESCRIPTION
Implement a simple cipher class to encode or decode a message with a key.
If there was no key provided, generate one minumum 100 characters long contains only lower case letter (a-z).

.EXAMPLE
$cipher = [SimpleCipher]::new("mykey")

$cipher.Encode("aaaaa")
Return: "mykey"

$cipher.Decode("ecmvcf")
Return: "secret"
#>

Class SimpleCipher {
    [string]$_key

    SimpleCipher() {
        $this._key = $this.randomKey
    }

    SimpleCipher([String]$key) {
        $this._key = $key
    }
    
    hidden [string] randomKey() {
        return -join ((97..122) |
        Get-Random -Count 100 |
        ForEach-Object { [char]$_ })
    }

    [string] Encode([string]$text) {
        $index = 0
        $result = @()
        foreach ($c in $text.ToCharArray()) {
            $result += [char](($c + $this._key[$index]) % 97)
            $index++
        }
        return -join $result
    }

    [string] Decode([string]$text) {
        $index = 0
        $result = @()
        foreach ($character in $text.ToCharArray()) {
            $result += [char](($character - $this._key[$index]) % 97)
            $index++
        }
        return -join $result
    }
}