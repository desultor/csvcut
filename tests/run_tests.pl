#!/usr/bin/perl

use warnings;
use strict;

# I don't see a way to do testing without installing extra python packages, so
# for now I'm just doing it with this.  

my @tests;

my $test1 = sub {
  print "foo";
};

#push @tests, $test1;
push @tests, (
  sub {  
    print "Cut out 'foo' from a single tsv file: ";
	my $result = `csvcut foo test_sets/sample_csv.tsv`;
	open OUT, ">script_outputs/foo_tsv.result" or die "can't: $!";
	print OUT $result;
	close OUT;
	my $foo = system("diff script_outputs/foo_tsv.result expected_results/foo_tsv.result");
	if ($foo == 0) {
	  print "SUCCESS\n";
	} else {
	  print "FAILURE\n";
	}
  },
);

map {&{$_}} @tests;
