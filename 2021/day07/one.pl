#!/usr/bin/perl

use strict;
use warnings;
use List::Util qw(min max);

open(my $fh, "<", "input") or die "Failed to open file: $!\n";
# open(my $fh, "<", "test") or die "Failed to open file: $!\n";
my @input = <$fh>;
close($fh);
chomp @input;

my @crabs = sort { $a <=> $b } split /\,/, $input[0];

my $min = 1_000_000;
for my $i ( min(@crabs)..max(@crabs) ) {
    my $test = 0;
    for my $c ( @crabs ) {
        $test += $c > $i ? $c - $i : $i - $c;
    }
    $min = $test if ( $test < $min );
}

print $min, "\n";