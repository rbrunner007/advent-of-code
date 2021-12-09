#!/usr/bin/perl

use strict;
use warnings;
use List::Util qw(min max sum);
use experimental "switch";

open(my $fh, "<", "input") or die "Failed to open file: $!\n";
# open(my $fh, "<", "test") or die "Failed to open file: $!\n";
my @input = <$fh>;
close($fh);
chomp @input;

my @outputs;

my $count = 0;
for ( @input ) {
    my @s = split(/\|\s+/, $_ );
    my @o = split(/\s/, $s[1]);
    for ( @o ) {
        given (length $_) {
            when (2) { $count++; } # 2
            when (3) { $count++; } # 3
            when (4) { $count++; } # 4
            when (7) { $count++; } # 8
        }
    }
    # last;
}
print $count, "\n";