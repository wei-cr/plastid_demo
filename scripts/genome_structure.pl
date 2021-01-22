#!/usr/bin/perl -w
use AlignDB::IntSpan;

my $set = AlignDB::IntSpan->new;
my $set1 = AlignDB::IntSpan->new;
my $set2 = AlignDB::IntSpan->new;
my $set3 = AlignDB::IntSpan->new;
my $set4 = AlignDB::IntSpan->new;
$set1->add_range(1,84170);
$set2->add_range(84171,110434);
$set3->add_range(110435,128214);
$set4->add_range(128215,154478);
$set1->as_string;
$set2->as_string;
$set3->as_string;
$set4->as_string;
my @a;

while(<>){
    chomp();
    if (/^#/){
        next;
    }else{
        @a=split /\t/,$_;
        if ($set1->find_islands( $a[1] )){
            print "$a[0]\t$a[1]\t"."LSC\n";
        }elsif($set2->find_islands( $a[1] )){
            print "$a[0]\t$a[1]\t"."IRa\n";
        }elsif($set3->find_islands( $a[1] )){
            print "$a[0]\t$a[1]\t"."SSC\n";
        }else{
            print "$a[0]\t$a[1]\t"."IRb\n";
        }
    }

}
