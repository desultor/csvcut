#!/usr/bin/perl

use warnings;
use strict;

# I don't see a way to do testing without installing extra python packages, so
# for now I'm just doing it with this.  

# return a reference for a function to test a particular invocation of
# the script
sub command_test {
  my ($explanation_string, # the plaintext describing the test
      $command, # the command to be tested
	  $resultfile) # the name of the result file (same as expected results file)
	  = @_;
  return sub {  
    print "$explanation_string: ";
	my $result = `$command`;
	open OUT, ">script_outputs/$resultfile" or die "can't: $!";
	print OUT $result;
	close OUT;
	my $foo = system("diff script_outputs/$resultfile expected_results/$resultfile");
	if ($foo == 0) {
	  print "SUCCESS\n";
	  unlink "script_outputs/$resultfile";
	} else {
	  print "FAILURE\n";
	}
  },
}


# create a list of the test functions
my @tests;
push @tests, (
  command_test(q(Cut out column "foo" from a single tsv file),
			   q(csvcut foo test_sets/sample_csv.tsv),
			   q(tsv.result)),
  command_test(q(Cut out column "foo" from all the tsv files),
			   q(csvcut foo test_sets/*.tsv),
			   q(multiple_tsv.result)),
  command_test(q(Cut out column "two words" from a tsv file),
			   q(csvcut "two words" test_sets/sample_csv.tsv),
			   q(two_words_tsv.result)),
  command_test(q(Cut out column "bar" from a csv file),
			   q(csvcut bar test_sets/sample_csv.csv --delimiter ,),
			   q(csv.result)),
  command_test(q(Delimiter argument at the front of the command),
			   q(csvcut --delimiter , bar test_sets/sample_csv.csv),
			   q(csv_delimiter_front.result)),
  command_test(q(Delimiter argument in the middle of the command),
			   q(csvcut bar --delimiter , test_sets/sample_csv.csv),
			   q(csv_delimiter_middle.result)),
  command_test(q(Quote the delimiter),
			   q(csvcut bar test_sets/sample_csv.csv --delimiter ","),
			   q(csv_delimiter_quoted.result)),
  command_test(q(Use shortened delimiter command line switch),
			   q(csvcut -d , bar test_sets/sample_csv.csv),
			   q(csv_delimiter_short_switch.result)),
  command_test(q(Short switch quoted delimiter in other position),
			   q(csvcut bar -d ',' test_sets/sample_csv.csv),
			   q(csv_delimiter_short_switch_2.result)),
);

# run the test functions
map {&{$_}} @tests;

