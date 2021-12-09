#!/usr/bin/perl

use strict;
use warnings;

open(my $fh, "<", "input") or die "Failed to open file: $!\n";
my @input = <$fh>;
close($fh);
chomp @input;

my $count = 0;
my $prev = shift(@input);
foreach ( @input ) {
    $count++ if ( $_ > $prev );
    $prev = $_;
}

print($count);
