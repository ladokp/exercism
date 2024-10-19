package KindergartenGarden;

use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<plants>;

sub plants ( $diagram, $student ) {
    my %plants = (
        C => 'clover',
        G => 'grass',
        R => 'radishes',
        V => 'violets',
    );
    my @rows = split /\n/, $diagram;

    my $idx = 0;
    for ( 'A' .. 'Z' ) {
        last if substr( $student, 0, 1 ) eq $_;
        $idx += 2;
    }

    return [ map { $plants{$_} } map { split //, substr $_, $idx, 2 } @rows ];

}
;
