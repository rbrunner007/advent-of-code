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

my @values;
for ( @input ) {
    my %numbers;
    my @halves = split(/\|\s+/, $_ );
    my @sample = split(/\s+/, $halves[0]);
    my @output = split(/\s+/, $halves[1]);

    for my $n ( sort { length $a cmp length $b } @sample ) {
            when (2) {
                # 1
                my @chars = sort split(//, $n);
                $numbers{1} = \@chars;
            } 
            when (3) {
                # 7
                my @chars = sort split(//, $n);
                $numbers{7} = \@chars;
            } 
            when (4) { 
                # 4
                my @chars = sort split(//, $n);
                $numbers{4} = \@chars;
            } 
            when (5) { 
                # 2, 3, or 5
                my @chars = sort split(//, $n);
                if ( grep { @{$numbers{1}}[0] eq $_ } @chars and grep { @{$numbers{1}}[1] eq $_ } @chars ) {
                    # 3
                    $numbers{3} = \@chars;
                } else {
                    # 2 or 5
                    my $overlap = grep { $_ ~~ @{$numbers{4}} } @chars;
                    if ( $overlap > 2 ) {
                        # 5
                        $numbers{5} = \@chars;
                    } else {
                        # 2
                        $numbers{2} = \@chars;
                    }
                }
            } 
            when (6) { 
                # 0, 6, or 9
                my @chars = sort split(//, $n);
                if ( grep { @{$numbers{1}}[0] eq $_ } @chars and grep { @{$numbers{1}}[1] eq $_ } @chars ) {
                    # 0 or 9
                    my $overlap = grep { $_ ~~ @{$numbers{4}} } @chars;
                    if ( $overlap > 3 ) {
                        # 9
                        $numbers{9} = \@chars;
                    } else {
                        # 0
                        $numbers{0} = \@chars;
                    }
                } else {
                    # 6
                    $numbers{6} = \@chars;
                }
            } 
            when (7) {
                # 8
                my @chars = sort split(//, $n);
                $numbers{8} = \@chars;
            } 
        }
    }

    my $num = "";
    for ( @output ) {
        my $name = join "", sort(split(//, $_));
        for (0..9) {
            if ( $name eq join("", @{$numbers{$_}})) {
                $num = $num . $_;
                # print $_;
                last;
            }
        }
    }
    push @values, $num;

}

print sum(@values), "\n";
