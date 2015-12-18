#!/usr/local/bin/perl

##
## This script does "string replacement" on the standard input. You specify the rules for translation in a file. 
## The script would load the rules and store them in a hash table, and then replace any matched strings in the standard input.

## It shows you how to handle arguments including "-help". It's also a good example of how to iteration over all the entries in a hash table. 
##
##

use English;
use Carp;
use Getopt::Long;

sub Usage{
  my $message = shift;

  print STDERR $message, "\n" if $message;
  print STDERR "\nUsage: $0 -d(ef) definition_file < source > newsource\n";

  print STDERR <<'EOM';
          -d(ef) filename  : Specifies the definition file which is a set of pairs, each corresponding to a "replacement pattern", e.g., 
                             a A
                             b B
			     ...
			     z Z
			     would replace all lower cases with upper cases

          -h(elp) 	: display this message

EOM

    exit(1);

}

if (! &GetOptions("help", "def=s") or
    $opt_help) {
  &Usage();
}

open(D, $opt_def) || die "can't open definition file:$opt_def\n";
while (<D>) {
    ($oldp, $newp) = split;
    $dic{$oldp}=$newp;
}
close(D);

$oldStr = "";
$newStr ="";
while (<STDIN>) {
    $oldStr = $_;
    foreach $k (keys %dic) {
	s/$k/$dic{$k}/g;
    }
    
    $newStr = $_;
    if ($oldStr ne $newStr) {
	print STDERR "\n";
	print STDERR "old>>$oldStr";
	print STDERR "new>>$newStr";
    }
    print;
}



