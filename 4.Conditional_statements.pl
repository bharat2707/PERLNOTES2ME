#In this section we are going to learn about Conditional statements in perl
#Namely: => if/ if..elsif..else/ if..else : This first evaluates the condition to be true and then proceeds
#        => unless..elsif..else :This evaluates the condition to be false and then proceeds..It functions opposite of if statement
#        => switch : It can be used when we require case by case analysis
#        =>ternary (?:) :Used when only true or false has to be checked

#!usr/bin/perl
use strict;

#Change below assigned values to play around with the conditional statements and check..
#Feel free to change the values of $a and $b and play around
my ($a, $b) = (500, 1000);

#If you have gone through operators in previous section then you can idenitfy the 'equality' operator and 'logical and' used here.
#Example of  if/ if..elsif..else/ if..else
if ($a == 500) {
    print "India banned 500 Rupees currency notes\n";
} elsif ($b == 1000) {
    print "India banned 1000 Rupees currency notes\n";
} elsif ($a == 500 && $b == 1000) {
    print "India banned the exsisting 500 and 1000 rupee currency notes\n";
} else {
    print "The denomination entered is valid and in use\n";
}


#Example of unless..elsif..else
#unless works opposite of if
unless($a != 500) {
    print "India banned 500 Rupees currency notes\n";
} elsif ($b == 1000) {
    print "India banned 1000 Rupees currency notes\n";
} else {
    print "Use all types of cards\n";
}

#Example of Switch
#Don't forget to intialise switch..Also check how do we import module..Detail explanation in the following example will be provided
#For now just know that we import modules like switch does
#Try out various cases but switch case is not used much
use Switch;

my $var = 'a';#10;
my @array = (10, 20, 30);
my %hash = ('key1' => 10, 'key2' => 20);

switch($var){
   case (10) { 
       print "number 100\n";
       next;
   } case "a" { 
       print "string a\n";
       next;
   } case [1..10,42] { 
       print "number in list 42\n";
   } case (\@array) { 
       print "number in list\n";
   } case (\%hash) {
       print "entry in hash\n";
   } else  { 
       print "previous case not true\n";
   }
}



#Example of ternary
#value assigned is determined based on condition..Mostly used when yes or no option is required#
my $c = $a == 500 ? $a : $b;
print $c."\n";


