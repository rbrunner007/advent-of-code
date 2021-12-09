#!/usr/bin/perl

use strict;
use warnings;

open(my $fh, "<", "input") or die "Failed to open file: $!\n";
# open(my $fh, "<", "test") or die "Failed to open file: $!\n";
my @input = <$fh>;
close($fh);
chomp @input;

my @fishes = split /\,/, $input[0];

$, = ",";
# print @fishes, "\n";

for ( 1..80 ) {
    my @new = ();
    for ( my $i = 0; $i < scalar @fishes; $i++ ) {
        if ( $fishes[$i] == 0 ) {
            $fishes[$i] = 6;
            push @new, 8;
        } else {
            $fishes[$i]--;
        }
    }
    push @fishes, @new;
    # print @fishes, "\n";
}

print scalar @fishes, "\n";