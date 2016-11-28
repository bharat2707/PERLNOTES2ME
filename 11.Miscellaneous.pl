#Splices concept
#!/usr/bin/perl
use strict;

#How to remove an element from the middle of an array in Perl?
my @dwarfs = qw(Doc Grumpy Happy Sleepy Sneezy Dopey Bashful);
splice @dwarfs, 3, 2;
print "@dwarfs\n";    # Doc Grumpy Happy Dopey Bashful

#As you can see the 4th and 5th elements of the array were removed. 
#That's because the second parameter of splice is the offset of the first element to be removed,
#and the third parameter is the number of elements to be removed.

#How to insert an element in the middle of an array in Perl?
my @dwarfs = qw(Doc Grumpy Happy Sleepy Sneezy Dopey Bashful);
splice @dwarfs, 3, 0, 'SnowWhite';
print "@dwarfs\n";
# Doc Grumpy Happy SnowWhite Sleepy Sneezy Dopey Bashful
#In this case we used splice to insert an element.
#Normally the second parameter (the offset) defines where to start the removal of elements,
#but in this case the third parameter - the number of elements - was 0 so splice has not removed any elements.
#Instead, the offset is used as the position to insert something new: the value passed as the 4th parameter to splice.
#That's how SnowWhite ended up among the seven dwarfs.
#
#For other uses of splice refer "https://perlmaven.com/splice-to-slice-and-dice-arrays-in-perl"

#Manipulating Perl arrays: shift, unshift, push, pop.
#To understand the concept check the below link.
#https://perlmaven.com/manipulating-perl-arrays
#
#Updated the examples here and practise.
#
#
#Will update this section if any concepts are missed out..Also let me know if you need any examples or you would want to learn anything 
#else related to perl.
