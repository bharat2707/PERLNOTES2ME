#For detailed explanation on operators refer the link below
#https://www.tutorialspoint.com/perl/perl_operators.htm
#Some examples of operators
#!user/bin/perl
use strict;

#Arithmatic operators example
my ($a, $b) = (500, 400);   #Scalar declaration as explained in datatypes section

#Addition operator
print  $a + $b."\n";

#Subtraction
print $a - $b."\n";

#Multiplication
print $a * $b."\n";

#Division: Outputs quotient
print $a / $b."\n";

#Modulus: Outputs reminder
print $a % $b ."\n";


#Note: Observe the difference between division operator and modulus
#To Do: Check difference between my and our declaration of data-types..
#Also make a note of other declaration types and update the declaration types in comment section with explanation 
#For Example: my $a; our $a; 

#Exponent
($a, $b) = (2, 5);
print $a ** $b."\n";

# . operator is used to append strings or new line/anything where you can use append operators
# concatenates two strings.	If 
$a="abc"; $b="def"; 
print $a.$b."\n";

#Other type of operators present are listed below and to be tried out follow the link mentioned in the beginning..
#Update this with the examples of all operators like the ones above

#Perl Equality Operators



#Perl Assignment Operators


#Perl Bitwise Operators


#Perl Logical Operators



#Quote-like Operators
print q(Hello How are you!)."\n";



#Miscellaneous Operators


#Go through perl operator precedence and keep in mind

