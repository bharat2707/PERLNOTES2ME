=h
S.N.	Types and Description
1	Scalar −
Scalars are simple variables. They are preceded by a dollar sign ($). A scalar is either a number, a string, or a reference. A reference is actually an address of a variable, which we will see in the upcoming chapters.

2	Arrays −
Arrays are ordered lists of scalars that you access with a numeric index which starts with 0. They are preceded by an "at" sign (@).

3	Hashes −
Hashes are unordered sets of key/value pairs that you access using the keys as subscripts. They are preceded by a percent sign (%).
=cut

#!/usr/bin/perl
use strict;

my $data = "Hello";
my @arr = ('bank', 'cc', 'fd');
my %hash = ( #key             #value
            'organisation' => 'SBI',
            'SBI'          => 'State Bank Of India',
            'IOB'          => 'Indian Overseas Bank',
            'OBC'          => 'Oriental Bank Of Commerce'
            );

print $data."\n";
print $arr[0]."\n";
print $hash{'SBI'}."\n";


#NOTE: To do..Try different ways of declaring and adding values to array and hash
