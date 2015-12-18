#!/usr/bin/perl
##
## This is like the "for" or "foreach" loop in a shell script, but it allows you to do some command with different numerical 
## parameter values specified in a file. It shows you how you can dynamically generate a command string and execute it with shell. 
## In general, you can run any command by calling a system function
##
##

while (<stdin>) {
    if (/^\s*([0-9]+)/) {
	$cmd = "$ARGV[0] $1 " . "$ARGV[1]";
	print STDERR "$cmd\n";
	system($cmd);
    }
}
