#!/usr/bin/perl

use strict;
use warnings;
use experimental 'switch';

open(my $fh, "<", "input") or die "Failed to open file: $!\n";
my @input = <$fh>;
close($fh);
chomp @input;

my @columns = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

foreach my $line ( @input ) {
    for ( my $i = 0; $i < length($line); $i++ ) {
        $columns[$i]++ if ( substr($line, $i, 1) == '1' );
    }
}

my @bin = map { $_ > (scalar(@input) / 2) ? 1 : 0 } @columns;
my $gamma = 0;
my $epsilon = 0;

for my $i (0..11) {
    $gamma += (2 ** (11 - $i)) * $bin[$i];
    $epsilon += (2 ** (11 - $i)) * !$bin[$i];
}
print($gamma * $epsilon, "\n");