#!/usr/bin/perl

use strict;
use warnings;

open(my $fh, "<", "input") or die "Failed to open file: $!\n";
# open(my $fh, "<", "test") or die "Failed to open file: $!\n";
my @input = <$fh>;
close($fh);
chomp @input;

my %points;
# $, = ",";
for my $line ( @input ) {
    my @coords = split /\s\-\>\s/, $line;
    my @start = split /\,/, shift @coords;
    my @end = split /\,/, shift @coords;


    # print $line, "\n";
    # check horizontal or vertical sections (x1 = x2 or y1 = y2)
    if ( $start[0] == $end[0] or $start[1] == $end[1] ) {
        # gotta make sure our ranges increment correctly, left and top are smaller than right and bottom
        my $left = $start[0] < $end[0] ? $start[0] : $end[0];
        my $right = $start[0] < $end[0] ? $end[0] : $start[0];
        my $top = $start[1] < $end[1] ? $start[1] : $end[1];
        my $bottom = $start[1] < $end[1] ? $end[1] : $start[1];

        for my $i ( $left..$right ) {
            for my $j ( $top..$bottom ) {
                # print $i, $j, "\n";
                if ( exists $points{join(",", $i, $j)}) {
                    $points{join(",", $i, $j)}++;
                } else {
                    $points{join(",", $i, $j)} = 1;
                }
            }
        }
    } else {
        my $i = $start[0];
        my $j = $start[1];
        while ( $i != $end[0] or $j != $end[1]) {
            # print $i, $j, "\n";
            if ( exists $points{join(",", $i, $j)}) {
                $points{join(",", $i, $j)}++;
            } else {
                $points{join(",", $i, $j)} = 1;
            }
            $start[0] < $end[0] ? $i++ : $i--;
            $start[1] < $end[1] ? $j++ : $j--;
        }

        # gotta find a way to add the far end of the line, do this one off
        if ( exists $points{join(",", $i, $j)}) {
            $points{join(",", $i, $j)}++;
        } else {
            $points{join(",", $i, $j)} = 1;
        }
    }
}

my $count = 0;
for ( keys %points ) {
    if ( $points{$_} > 1) {
        $count++;
    }
}
print $count, "\n";