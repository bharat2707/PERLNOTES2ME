#!/usr/bin/perl
use strict;

#Now why do we need to use functions?? In perl it is also called as subroutines.
#To minimise the repeatation work..To make the code more readable.Also edit this comment to add more uses of function
#Perl functions always return value.Explicit is always better than implicit..Hence use return; unless you want the value of last statement.
#Below is a simple example of function decalaration
#Generally function name can be camel case or seperated by underscore..Use function names specific to what exactly function does.
#Usually it is a good practise to leave a comment on what function does and returns

my $num = 10;
hello_world($num);

#Hello World function print Hello World
#No parameters are used here.
#return null on success

sub hello_world{
    my $num = shift;
    #Check what the below statement does by commenting the above..Also provide the explanation for both of them
    #in comments section
    #my ($num) = @_;
    print "Hello World!!\n$num\n";
    return;
}


#By now also start thinking on how can I auto-mate tasks..For example how can I get data dir number given that I have certain conditions
#given log file..
