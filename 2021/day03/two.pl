#!/usr/bin/perl

use strict;
use warnings;
use experimental 'switch';

open(my $fh, "<", "input") or die "Failed to open file: $!\n";
# open(my $fh, "<", "test") or die "Failed to open file: $!\n";
my @input = <$fh>;
close($fh);
chomp @input;

my @oxy = @input;
my @co2 = @input;
for ( my $i = 0; $i < length($input[0]); $i++ ) {
    my $oxy_count_ones = 0;
    my $co2_count_ones = 0;
    foreach ( @oxy ) {
        $oxy_count_ones++ if ( substr($_, $i, 1) == '1' );
    }
    foreach ( @co2 ) {
        $co2_count_ones++ if ( substr($_, $i, 1) == '1' );
    }
    @oxy = grep { substr($_, $i, 1) == $oxy_count_ones < scalar(@oxy)/2 ? 0 : 1 } @oxy if scalar @oxy > 1;
    @co2 = grep { substr($_, $i, 1) == $co2_count_ones < scalar(@co2)/2 ? 1 : 0 } @co2 if scalar @co2 > 1;
    last if ( scalar @oxy == 1 && scalar @co2 == 1);
}

my $oxy_rate = 0;
my $co2_rate = 0;
for my $i (0..length($input[0]) - 1) {
    $oxy_rate += (2 ** (length($input[0]) - 1 - $i)) * substr($oxy[0], $i, 1);
    $co2_rate += (2 ** (length($input[0]) - 1 - $i)) * substr($co2[0], $i, 1);
}
print($oxy_rate * $co2_rate, "\n");