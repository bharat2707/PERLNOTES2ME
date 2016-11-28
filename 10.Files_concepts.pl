#!/usr/bin/perl
use strict;

#Here subroutine explains the usage of reading data
#Write a function to write the contents of the file into another file..DIY (Do it yourself)


my $content = read_file();
print $content."\n";

sub read_file {
    my ($file) = @_;
    my $k;
    open FH, $file;
    $k .= $_ while (<FH>);
    close FH;
}

#To write to file you can use open FH, >$file..Also check for append what can be done
