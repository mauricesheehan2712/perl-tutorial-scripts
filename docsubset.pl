#!/usr/local/bin/perl
#
#
# This script extracts a subset of docs from a database. The target doc id is specified in a separate file. 
# It shows you how to use the associative array (hash table) to store the target IDs. 
# It also shows you a common way of detecting the beginning and end of a document through pattern matching. 
#
#


open(C, "$ARGV[0]") || die "can't open candidate doc id list file:$ARGV[0]\n";

while (<C>) {
    /([^\s]+)/;
    $dict{$1}=1;
}
close(C);

while (<stdin>) {
    if (/<DOC\s+([^\s>]+)/) {
	$docID = $1;
    } elsif (/<\/DOC>/) {
	if (defined $dict{$docID}) {
	    print "<DOC $docID>\n";
	    print "$docText\n";
	    print "<\/DOC>\n";
	}
	$docText ="";
	$docID ="";
    } else {
	$docText .= $_;
    }
}



