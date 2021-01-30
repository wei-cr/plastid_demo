#!/usr/bin/perl -w
use AlignDB::IntSpan;
my $integer=4; 
my $set = AlignDB::IntSpan->new;
$set->add(1, 2, 3, 5, 7, 9);
$set->add_range(100, 1_000_000);
print $set->as_string, "\n";    # 1-3,5,7,9,100-1000000
my $island = $set->find_islands( $integer );
if ($island){
    print "$island\n";}
