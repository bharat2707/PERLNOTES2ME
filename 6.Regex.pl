#This is the 'MOST' important concept in perl..Pay extra attention..Pactise as much as possible..Link to practise regex is "https://regex101.com/"
#Feel free to add more links if you find.
#!usr/bin/perl
use strict;

#The basic method for applying a regular expression is to use the pattern binding operators =~ and !~.
#The first operator is a test and assignment operator.
#There are three regular expression operators within Perl.
#1. Match Regular Expression - m//
#2. Substitute Regular Expression - s///
#3. Transliterate Regular Expression - tr///
#The forward slashes in each case act as delimiters for the regular expression (regex) that you are specifying.
#If you are comfortable with any other delimiter, then you can use in place of forward slash.

################################################################################################################
#For detail explanation refer "https://www.tutorialspoint.com/perl/perl_regular_expressions.htm"
###############################################################################################################


######################More Complex Regular Expressions#########################################################
#You don't just have to match on fixed strings. 
#In fact, you can match on just about anything you could dream of by using more complex regular expressions. Here's a quick cheat sheet −
#Following table lists the regular expression syntax that is available in Python.
#_______________________________________________________________________________________________________________________________________
#Pattern  |	        Description                                                                                                        |
#  ^	  |  Matches beginning of line.                                                                                                |
#  $	  |  Matches end of line.                                                                                                      |
#  .	  |  Matches any single character except newline. Using m option allows it to match newline as well.                           |
#[...]	  |  Matches any single character in brackets.                                                                                 |
#[^...]	  |  Matches any single character not in brackets.                                                                             |
#  *	  |  Matches 0 or more occurrences of preceding expression.                                                                    |
#  +	  |  Matches 1 or more occurrence of preceding expression.                                                                     |
#  ?	  |  Matches 0 or 1 occurrence of preceding expression.                                                                        |
# { n}	  |  Matches exactly n number of occurrences of preceding expression.                                                          |
# { n,}	  |  Matches n or more occurrences of preceding expression.                                                                    |
# { n, m} |  Matches at least n and at most m occurrences of preceding expression.                                                     |
# a| b	  |  Matches either a or b.                                                                                                    |
# \w	  |  Matches word characters.                                                                                                  |
# \W	  |  Matches nonword characters.                                                                                               |
# \s	  |  Matches whitespace. Equivalent to [\t\n\r\f].                                                                             |
# \S	  |  Matches nonwhitespace.                                                                                                    |
# \d	  |  Matches digits. Equivalent to [0-9].                                                                                      |
# \D	  |  Matches nondigits.                                                                                                        |
# \A	  |  Matches beginning of string.                                                                                              |
# \Z	  |  Matches end of string. If a newline exists, it matches just before newline.                                               |
# \z	  |  Matches end of string.                                                                                                    |
# \G	  |  Matches point where last match finished.                                                                                  |
# \b	  |  Matches word boundaries when outside brackets. Matches backspace (0x08) when inside brackets.                             |
# \B	  |  Matches nonword boundaries.                                                                                               |
# \n, \t  |                                                                                                                            |
# , etc.  |	  Matches newlines, carriage returns, tabs, etc.                                                                           |
#[aeiou]  |	Matches a single character in the given set                                                                                |
#[^aeiou] |	Matches a single character outside the given set                                                                           |
#______________________________________________________________________________________________________________________________________|_
#
#Focus on diffrence between .*? | .* 
#When using match operator focus on isg in the end..Why it is used?? and practise with examples..

#Now we will discuss on how to use regex aka regular expressions

#While going through these things also go through perl special variables like $_, $^O, $- and so on..Link to this is 
#https://www.tutorialspoint.com/perl/perl_special_variables.htm

my $pan = 'awert1234q';
$pan = uc($pan);
print "$pan\n";
#Similarly check out for lower case (lc)..

print "ERROR: PAN is invalid\n" if ($pan !~ /^\s*[a-z]{5}\d{4}[a-z]{1}\s*$/i);
#First we assign a value to PAN(Permanent Account Number). Then we can use validation check to see if PAN is valid or not..
#We have introduced few regex (Regular Expressions) while doing it..Identify each of them and understand there functionality.
#Also come up with examples with more regex usage.


my $str = "How do you do do do??";

my @do_count = $str =~ /do/isg;

print @do_count."\n";

#Above example gives you number of count of a letter..Practise few of them on your own to get hold of regex concepts.
#If you have gone through step wise you will know the use of strings, arrays used above..You can try the same using split function..DIY
#(Do it Yourself) exercise.


$str = "Check Number is 1234567 and count some random number is 89";

if ($str =~ /^.*?\s+(\d{4,7})\s+.*?(\d{2})\s*$/) {
    my $cheque_num = $1;
    print $cheque_num."\n";
}

#Above is an example where for number regex can be applied..
#We have used one of perl special variable above $1 which stores the data..Similarly you can use from $1..$9
#Explore few more examples on your own and add them here with regex.

