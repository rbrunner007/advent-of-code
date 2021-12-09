#!/usr/bin/perl

use strict;
use warnings;

open(my $fh, "<", "input") or die "Failed to open file: $!\n";
my @input = <$fh>;
close($fh);
chomp @input;

my $count = 0;
my $prev_sum = $input[0] + $input[1] + $input[2];

for ( my $i = 2; $i < scalar @input - 1; $i++ ) {
    my $window_sum = $input[ $i - 1 ] + $input[ $i ] + $input[ $i + 1];
    
    $count++ if ( $prev_sum < $window_sum );
    $prev_sum = $window_sum;
}

print($count);