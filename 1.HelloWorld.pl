#Basic script to check if perl is installed/already present in the system#
#NOTE: Always use => use strict because it helps in avoiding unwanted syntax errors.
#First line is added to locate the perl
#print is an inbuilt data-type in perl which helps to print out the stuffs

#!/usr/bin/perl
use strict;

print "Hello World\n";


#If the same thing has to be entered through keyboard input?? Let see
my $str = <STDIN>;

print "String entered from Keyboard is $str\n";

#For now don't worry what my $str does..To know that move on to next section..
#For now understand that <STDIN> is used for input from keyboard
