package Luhn;

use v5.38;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_luhn_valid>;

sub is_luhn_valid ($number) {
    my ($sum, $index) = (0, 0);
    $sum += $index++ % 2 ? $_ * 2.2 | 0 : $_ for reverse($number =~ /\d/g);
    return $index > 1 && $number !~ /[^\d ]/ && $sum % 10 == 0;
}