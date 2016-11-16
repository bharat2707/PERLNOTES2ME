#!usr/bin/perl
use strict;

#There may be a situation when you need to execute a block of code several number of times. 
#In general, statements are executed sequentially: The first statement in a function is executed first, followed by the second, and so on.
#Programming languages provide various control structures that allow for more complicated execution paths.
#A loop statement allows us to execute a statement or group of statements multiple times
#
#Different kind of loops present in perl are followed by examples
#1.while loop : Repeats a statement or group of statements while a given condition is true. It tests the condition before executing the loop body.
my $counter = 0;
#Experiment here by changing conditions and values and have fun..Try new examples on your own for all looping structures..
while ($counter <= 10) {
    print ("Counter is incremented by $counter\n");
    $counter++;
}
print "###For distinction between while and for loop\n";


#2.until loop : Repeats a statement or group of statements until a given condition becomes true. It tests the condition before executing the loop body.
#Comment below statement and check what happens and see why it happens..while is preferred looping structure until is used sparsely
$counter = 20;
until ($counter == 30) {
    print ("Counter is incremented by $counter\n");
    $counter++;
}
print "###For distinction between until and for loop\n";

#3.for loop : Executes a sequence of statements multiple times and abbreviates the code that manages the loop variable.
$counter = 20;
for (my $i =10; $i < $counter; $i++) {
    print ("Counter value is $i\n");
}

print "###For distinction between for and foreach loop\n";

#4.foreach loop : The foreach loop iterates over a normal list value and sets the variable VAR to be each element of the list in turn.
#Acts same for numbers and strings#
my @array = ("You", "are", "doing", "awesome.");
foreach my $a (@array) {
    print $a." ";
}

print "###For distinction between foreach loop and do..while loop\n";


#5.do...while loop : Like a while statement, except that it tests the condition at the end of the loop body
#Just check out diff between < and <=..
$a = 10;

# do...while loop execution
do{
   printf "Value of a: $a\n";
   $a = $a + 1;
}while( $a < 20 );


#6.nested loops : You can use one or more loop inside any another while, for or do..while loop.
#
#This is using looping constructs one inside the other as the name suggests..
$a = 0;
$b = 0;

# outer while loop
while($a < 3){
   $b = 0;
   # inner while loop
   while( $b < 3 ){
      print "value of a = $a, b = $b\n";
      $b = $b + 1;
   }
   $a = $a + 1;
   print "Value of a = $a\n\n";
}

#Similarly all other looping structures can be used..You can use for inside while and so on..Practise all these and have fun.

