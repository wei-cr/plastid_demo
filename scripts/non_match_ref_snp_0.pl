#!/usr/bin/perl -w
my (@a,@b,@sample);
my $m;
my %hash = (
    2734 => "G\tA",
    4870 => "G\tT",
    5705 => "A\tC",
    5943 => "A\tG",
    8008 => "A\tT",
    8166 => "C\tA",
    8502 => "A\tT",
    12831 => "G\tA",
    16052 => "C\tT",
    17823 => "T\tG",
    23915 => "T\tG",
    26999 => "G\tT",
    27538 => "C\tA",
    30175 => "A\tC",
    31912 => "A\tC",
    36798 => "T\tC",
    37256 => "G\tC",
    46474 => "A\tC",
    46541 => "T\tG",
    50688 => "T\tA",
    58549 => "A\tG",
    65250 => "T\tC",
    65545 => "T\tG",
    66723 => "C\tA",
    67315 => "C\tA",
    67857 => "C\tT",
    69342 => "G\tA",
    69347 => "A\tG",
    72592 => "T\tG",
    74255 => "C\tT",
    80688 => "T\tG",
    82349 => "A\tC",
    83321 => "G\tA",
    113770 => "G\tT",
    115009 => "T\tA",
    125515 => "T\tG",
    128183 => "G\tT",
);

while (<>){
    if (/^#/){
        next;
    }else {
        @a=split /\t/,$_; 
        if (!exists $hash{$a[1]}){
                foreach  $index (9 .. $#a){
                    $m = (split (/:/,$a[$index]))[2];
                    if ($m=~/\d/){
                        push(@b,$m);
			push(@sample,$index);
                    }                              
                }
            print "$a[0]\t$a[1]\t$a[3]\t$a[4]\t";
            print join("\t",@b);
	    print "\n";
            @b=();
                           
            }
        }
        
}
