unit module SecretHandshake;

sub handshake(Int $number) is export {
    my @actions = 'wink', 'double blink', 'close your eyes', 'jump';
    my @result;

    for ^@actions.elems -> $index {
        @result.push(@actions[$index]) if $number +& 2 ** $index;
    }

    return $number +& 16 ?? @result.reverse !! @result;
}
