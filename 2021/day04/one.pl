#!/usr/bin/perl

use strict;
use warnings;

open(my $fh, "<", "input") or die "Failed to open file: $!\n";
# open(my $fh, "<", "test") or die "Failed to open file: $!\n";
$/ = "\n\n";
my @input = <$fh>;
close($fh);
chomp @input;

my @numbers = split /\,/, shift @input;

$, = " ";
print @numbers, "\n";


my @boards = ();
for ( @input ) {
    my @board = ();
    my @rows = split /\n/, $_;
    for my $row ( @rows ) {
        $row =~ s/^\s+|\s+$//g;
        my @columns = split /\s+/, $row;
        push @board, \@columns;
    }
    push @boards, \@board;
}

my $winner = ();
my $win_num = 0;
for my $num ( @numbers ) {
    # mark each number found with 'x'
    for my $board ( @boards ) {
        for my $row ( @{$board} ) {
            for my $space ( @{$row} ) {
                $space = 'x' if $space eq $num;
            } 
        }
    }

    # check each board to see if its a winner
    for my $board ( @boards ) {
        if ( bingo($board) ) {
            $winner = $board;
        }
    }

    if ( $winner ) {
        $win_num = $num;
        last;
    }
}

print $win_num, "\n";
print_board( $winner );
print sum_board( $winner ) * $win_num, "\n";

sub sum_board {
    my $board = shift;
    my $sum = 0;
    for my $row ( @{$board} ) {
        for my $space ( @{$row} ) {
            unless ( $space eq 'x' ) {
                $sum += $space;
            }
        } 
    }

    return $sum;
}

sub print_board {
    my $board = shift;
    for my $row ( @{$board} ) {
        for my $space ( @{$row} ) {
            print $space, " ";
        } 
        print "\n";
    }
}

sub bingo {
    my $board = shift;

    # check for bingo
    if ($board->[0][0] eq 'x' and $board->[0][1] eq 'x' and $board->[0][2] eq 'x' and $board->[0][3] eq 'x' and $board->[0][4] eq 'x' ) {
            return 1;
    } elsif ($board->[1][0] eq 'x' and $board->[1][1] eq 'x' and $board->[1][2] eq 'x' and $board->[1][3] eq 'x' and $board->[1][4] eq 'x' ) {
            return 1;
    } elsif ($board->[2][0] eq 'x' and $board->[2][1] eq 'x' and $board->[2][2] eq 'x' and $board->[2][3] eq 'x' and $board->[2][4] eq 'x' ) {
            return 1;
    } elsif ($board->[3][0] eq 'x' and $board->[3][1] eq 'x' and $board->[3][2] eq 'x' and $board->[3][3] eq 'x' and $board->[3][4] eq 'x' ) {
            return 1;
    } elsif ($board->[4][0] eq 'x' and $board->[4][1] eq 'x' and $board->[4][2] eq 'x' and $board->[4][3] eq 'x' and $board->[4][4] eq 'x' ) {
            return 1;
    } elsif ($board->[0][0] eq 'x' and $board->[1][0] eq 'x' and $board->[2][0] eq 'x' and $board->[3][0] eq 'x' and $board->[4][0] eq 'x' ) {
            return 1;
    } elsif ($board->[0][1] eq 'x' and $board->[1][1] eq 'x' and $board->[2][1] eq 'x' and $board->[3][1] eq 'x' and $board->[4][1] eq 'x' ) {
            return 1;
    } elsif ($board->[0][2] eq 'x' and $board->[1][2] eq 'x' and $board->[2][2] eq 'x' and $board->[3][2] eq 'x' and $board->[4][2] eq 'x' ) {
            return 1;
    } elsif ($board->[0][3] eq 'x' and $board->[1][3] eq 'x' and $board->[2][3] eq 'x' and $board->[3][3] eq 'x' and $board->[4][3] eq 'x' ) {
            return 1;
    } elsif ($board->[0][4] eq 'x' and $board->[1][4] eq 'x' and $board->[2][4] eq 'x' and $board->[3][4] eq 'x' and $board->[4][4] eq 'x' ) {
            return 1;
    }

    return 0;
}