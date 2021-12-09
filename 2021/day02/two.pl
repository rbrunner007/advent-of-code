#!/usr/bin/perl

use strict;
use warnings;
use experimental 'switch';

open(my $fh, "<", "input") or die "Failed to open file: $!\n";
my @input = <$fh>;
close($fh);
chomp @input;

my $hoz = 0;
my $dep = 0;
my $aim = 0;

foreach ( @input ) {
    my @dirs = split(/ /, $_);
    given ( $dirs[0] ) {
        when ( "forward" ) { $hoz += $dirs[1];
                                $dep += $aim * $dirs[1]; }
        when ( "down" ) { $aim += $dirs[1] }
        when ( "up" ) { $aim -= $dirs[1] }
    }
    # print($dirs[0], $dirs[1]);
}

print($dep * $hoz);