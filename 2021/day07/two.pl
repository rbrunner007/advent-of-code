#!/usr/bin/perl

use strict;
use warnings;
use List::Util qw(min max sum);

open(my $fh, "<", "input") or die "Failed to open file: $!\n";
# open(my $fh, "<", "test") or die "Failed to open file: $!\n";
my @input = <$fh>;
close($fh);
chomp @input;

my @crabs = sort { $a <=> $b } split /\,/, $input[0];

my %memo = ();
my $min = 1_000_000_000;
for my $i ( min(@crabs)..max(@crabs) ) {
    # print $i, " ";
    my $test = 0;
    for my $c ( @crabs ) {
        my $diff = $c > $i ? $c - $i : $i - $c;
        my $val = $diff * ($diff + 1) / 2;
        # print $c, ",", $diff, ",", $val, " ";
        $test += $val;
    }
    $min = $test if ( $test < $min );
    # print "\n";
}

print $min, "\n";