#!/usr/local/bin/perl

# This is a simple script that computes the average of each column in a table of data. It shows one common usage : 
# read in the data and split each line directly to "words" and store these words in an array. 
#


$count = 0;
while (<stdin>) {
    @w = split;
    $count++;
    for ($i=0; $i<=$#w; $i++) {
	$s[$i] += $w[$i];
    }
}

for ($i=0; $i<=$#w; $i++) {
    print $s[$i]/$count, "\t";
}

print "\n";
