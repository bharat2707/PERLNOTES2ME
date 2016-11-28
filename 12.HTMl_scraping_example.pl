#The Html file obtained is from below link.
#"http://insurance.kotak.com/omkm/rates_new.jsp"
#In coming sections with the use of invisible browser we will automate the website completely.Try to guess the module name till then.


#!/usr/bin/perl
use strict;

my %mon
    = qw (January 01 February 02 March 03 April 04 May 05 June 06 July 07 August 08 September 09 October 10 November 11 December 12);
my %smonth = qw (Jan 01 Feb 02 Mar 03 Apr 04 May 05 Jun 06 Jul 07 Aug 08 Sep 09 Oct 10 Nov 11 Dec 12);
my %rev_month
    = qw (01 January 02 February 03 March 04 April 05 May 06 June 07 July 08 August 09 September 10 October 11 November 12 December);
my $c;

main();
sleep(2);
exit(0);


sub main {
    $c = read_file('output1.html'); 
    my $date;
    if ($c =~ /Unit\s+Values\s+as\s+on\s*(.*?)\s*<\/span/is) {
        $date = $1;
        #By now you must be familiar with substitute function.Below used is an example of the same.
        $date =~ s/<.*?>|\,//g;
        $date =~ s/\(.*?\)//g;
        #Split function example is given below..
        #Def: The split() function is used to split a string into smaller sections. 
        #You can split a string on a single character, a group of characters or a regular expression (a pattern).
        #For more examples you can check 'http://perlmeme.org/howtos/perlfunc/split_function.html'.
        my @date = split(" ", $date);
        #Substring example is given below..
        #The substr() function is used to return a substring from the expression supplied as its first argument.
        #The function is a good illustration of some of the ways in which Perl is different from other languages you may have used. 
        #substr() has a variable number of arguments, it can be told to start at an offset from either end of the expression, 
        #you can supply a replacement string so that it replaces part of the expression as well as returning it, and it can be assigned to!
        #For more examples you can refer "http://perlmeme.org/howtos/perlfunc/substr.html", "http://perldoc.perl.org/functions/substr.html"
        my $mon = substr ($date[0],0,3);
        $date = $mon." ".$date[1]." ".$date[2];
        #Debug messages are added as the function name itself suggests for debugging..
        debug_print ("Date format is $date");
        #For explanation of below function used go to that function declaration
        $date = date_manip($date, "YYYY-MM-DD", "MMM DD YYYY");
        debug_print ("Date is $date");
    } else {
        #Error is caught..Try using perl warn function below
        debug_print("Date Not Found\n");
    }
    #Think of validation what can be added for incorrect date obtained

    my $match;
    if ($c =~ /Scheme\s+Name.*?Unit\s+Price(.*?)<\/table/is) {
        $match = $1;
        #below code is added to remove comments from HTML file#
        $match =~ s/<!--.*?-->//gs;
    }
    #If the match block is not present think of validation to be added

    my @rows = $match =~ /<tr.*?>(.*?)<\/tr/gis;
    my $daily_nav;
    foreach my $row (@rows) {
        my @cols = $row =~ /<td.*?>(.*?)<\/td/gis;
        $cols[0] =~ s/<.*?>|\(.*\)//g;
        my $plan = escape_comma($cols[0]);
        my $nav  = comma_space_free($cols[1]);
        $daily_nav .= $nav.",".$date.",".$plan."\n";
    }

    #Printing the obtained data between tags..Order required NAV, Date, Plan name
    print "#BeginResult\n";
    print $daily_nav;
    print "#EndResult\n";

}


sub debug_print {
    my $message = shift;
    print "KFetcher: $message\n";
}

#Go through below 2 functions and come up with explanations in comment section
sub escape_comma {
    my $n = shift;
    $n =~ s/\s+/ /g;
    $n =~ s/\&nbsp;/ /g;
    $n = $1 if ($n =~ /^\s*(.*?)\s*$/s);
    $n =~ s/,/\\,/g;
    return $n;
}

sub comma_space_free {
    my ($n) = @_;
    $n =~ s/\&nbsp\;//g;
    $n =~ s/(,|\s+|\\|[A-Z]|\(|\))+//ig;
    return $n;
}


#Below function as the name itself suggests it converts date format from MYSQLDT ('yyyy-mm-dd') to any other format and vice versa
sub date_manip {
    my ($date, $format_to, $format_in) = @_;
    my %input;
    my %output;

    $date =~ s/\&nbsp\;//g;
    $date =~ s/^\s*|\s*$//g;
    #I have not needed this frequently, but if you need to replace a set of characters with another set of characters in a string,
    #there is a better solution than using regexes.
    #In Perl tr is the transliterator tool that can replace characters by other characters pair-wise.
    #Example of which is used below..For further examples refer link 'https://perlmaven.com/replace-character-by-character'
    my $ret_date = '';
    $format_to =~ tr/[A-Z]/[a-z]/;
    $format_in =~ tr/[A-Z]/[a-z]/;
    $format_in =~ /\w+(.?)/;
    my @fields;
    my @date;
    #look up in google and provide explanation in comments section for pack and unpack
    if ($format_in =~ /yyyymmdd/) {
        my $unpack_str = "A4A2A2";
        @fields = unpack($unpack_str, $format_in);
        @date   = unpack($unpack_str, $date);
    } elsif ($format_in =~ /ddmmyyyy/) {
        @fields = unpack("A2A2A4", $format_in);
        @date   = unpack("A2A2A4", $date);
    } elsif ($format_in =~ /ddmmmyyyy/) {
        @fields = unpack("A2A3A4", $format_in);
        @date   = unpack("A2A3A4", $date);
    } elsif ($format_in =~ /ddmmmyy/) {
        @fields = unpack("A2A3A2", $format_in);
        @date   = unpack("A2A3A2", $date);
    } else {
        @fields = split($1, $format_in);
        @date   = split($1, $date);
    }
    @input{@fields} = @date;
    $format_to =~ /\w+(.?)/;
    my @output_fields;
    if ($format_to =~ /yyyymmdd/) {
        @output_fields = unpack("A4A2A2", $format_to);
    } elsif ($format_to =~ /ddmmyyyy/) {
        @output_fields = unpack("A2A2A4", $format_to);
    } else {
        @output_fields = split($1, $format_to);
    }

    my @zeros = qw(0 0 0);
    @output{@output_fields} = @zeros;

    #Retriving if Hash example..Using keys, foreach loop example..Check condition exists is also used..Look up for more 
    #explanation on google.
    foreach my $key (keys %input) {
        if ($key =~ /mm/) {
            if ($input{"mm"} && exists $output{"mmm"}) {
                $output{"mmm"} = substr($rev_month{(sprintf "%02d", $input{$key})}, 0, 3);
            } elsif ($input{"mmm"} && exists $output{"mm"}) {
                $output{"mm"} = $smonth{ucfirst(lc($input{$key}))};
            } elsif ($input{"mm"} && exists $output{"mmmm"}) {
                $output{"mmmm"} = $rev_month{($input{$key})};
            } elsif ($input{"mmmm"} && exists $output{"mm"}) {
                my $monthName = ucfirst(lc($input{$key}));
                if (length($monthName) == 3) {
                    $output{"mm"} = $smonth{$monthName};
                } else {
                    $output{"mm"} = $mon{$monthName};
                }
            } else {
                #sprintf is used to format numbers corectly..Try out few examples on your own
                $output{$key} = sprintf("%02d", $input{$key});
            }
            next;
        }
        if ($key =~ /yy/) {
            if ($input{"yy"} && exists $output{"yyyy"}) {
                $output{"yyyy"}
                    = length($input{"yy"}) == 2
                    ? 2000 + $input{"yy"}
                    : $input{"yy"};
            } elsif ($input{"yyyy"} && exists $output{"yy"}) {
                $output{"yy"} = sprintf("%02d", ($input{$key} - 2000));
            } else {
                $output{$key} = $input{$key};
            }
            next;
        }
        if (exists $output{$key} && $output{$key} == 0) {
            $output{$key} = sprintf("%02d", $input{$key});
        }
    }
    my $delim = '';
    $delim = $1 if ($1);
    #Here append function '.' is used..It is used to append 2 or more values as you can see in below example
    $ret_date .= $output{$_} . $delim foreach (@output_fields);
    $ret_date =~ s/$delim$//;
    return $ret_date;
}

#This is from files section where you read data from file and return the data for further use
sub read_file {
    my ($file) = @_;
    my $k;
    open FH, $file;
    $k .= $_ while (<FH>);
    close FH;
    return $k;
}

