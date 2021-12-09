#!/usr/bin/perl

use strict;
use warnings;

open(my $fh, "<", "input") or die "Failed to open file: $!\n";
# open(my $fh, "<", "test") or die "Failed to open file: $!\n";
my @input = <$fh>;
close($fh);
chomp @input;

my %fishes;
$fishes{0} = 0;
$fishes{1} = 0;
$fishes{2} = 0;
$fishes{3} = 0;
$fishes{4} = 0;
$fishes{5} = 0;
$fishes{6} = 0;
$fishes{7} = 0;
$fishes{8} = 0;

my @fish_list = split /\,/, $input[0];

for ( @fish_list ) {
    $fishes{$_}++;
}

for ( 1..256 ) {
    my $eight = $fishes{0};
    for ( 0..8 ) {
        $fishes{$_} = $fishes{$_ + 1};
    }
    $fishes{8} = $eight;
    $fishes{6} += $eight;
}

my $sum = 0;
map { $sum += $_ } values %fishes;

print $sum, "\n";