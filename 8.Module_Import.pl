#!/usr/bin/perl
use strict;

use Data::Dumper;

#We import module using use, require..Figure out the difference between the two and update the same with the explanation.
#Also check if there are any other ways of importing module and update the same in comments section.
#We are importing 2 modules..strict and Data::Dumper..strict is an inbuilt one

#Below is an example of array of hash refrence.Also Hash value can be an array..Data structure of these kind can be made..
#You can also use Array of Array, Hash of Array, Hash of Hash and so on..You can also use multiple combination of hashes and arrays
#also like hash of hash of array.
#To know more about reference check next file.
my $data = [{ title => 'This is a test header' },{ data_range =>
           [ 0, 0, 3, 9] },{ format     => 'bold' }];

print Dumper $data;
