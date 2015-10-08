package Bencher::Scenario::PermuteNamedModules;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    participants => [
        {
            module => "PERLANCAR::Permute::Named",
            code => sub {
                my @res = PERLANCAR::Permute::Named::permute_named(@_);
            },
        },
        {
            module => "Permute::Named",
            code => sub {
                my @res = Permute::Named::permute_named(@_);
            },
        },
        {
            module => "Permute::Named::Iter",
            code => sub {
                my $iter = Permute::Named::Iter::permute_named_iter(@_);
                my @res;
                while (my $h = $iter->()) { push @res, $h }
            },
        },
    ],
    datasets => [
        {argv=>[a=>[1,2], b=>[1,2,3]], name=>'small (2x3=6)'},
        {argv=>[a=>[1,2], b=>[1..50]], name=>'long (2x50=100)'},
        {argv=>[a=>[1,2], a=>[1,2], c=>[1,2], d=>[1,2], e=>[1,2], f=>[1,2], g=>[1,2], h=>[1,2], i=>[1,2], j=>[1,2]], name=>'wide (2**10=1k)'},
        {argv=>[a=>[1..10], b=>[1..10], c=>[1..10], d=>[1..2], e=>[1..2], f=>[1..3]], name=>'large (10x10x10x2x2x3=12ki)'},
    ],
};

1;
# ABSTRACT: Benchmark various modules calculating the Levenshtein edit distance
