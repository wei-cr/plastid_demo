#!/usr/bin/perl -w
use Switch; 
my (@a,@b,@count);
my ($m,$n);
while (<>){
    chomp;
    if (/^#/) {
        next;
    }else {
        @a=split /\t/,$_; 
	    if ($a[4] !~ /,/){
            foreach  $index (9 .. $#a){
                $m = (split (/:/,$a[$index]))[2];
                if ($m=~/\d/){
                    push(@b,$m);
                }else {next;}                             
                }       
                           
        }else {
            @count = split(/,/,$a[4]);
            $n=@count;
            switch ($n){
                case 2    { &f2(@a); } 
                case 3    { &f3(@a); }
                }
	        }
        }
        
}
foreach  (@b){
        print "$_\n";
            }


sub f2{
    my @d;
    foreach  $index (9 .. $#_){
	my $x = (split (/:/,$_[$index]))[2];
	if ($x =~ /,/){
	    @d = split /,/,$x;
	    if ($d[0] =~ /\d/){
		push (@b,$d[0]);
	    }else {
		push (@b,$d[1]);
	    }
	}else {next;}
    }
    return @b;

}

sub f3{
     my @d;
     foreach  $index (9 .. $#_){
	 my $x = (split (/:/,$_[$index]))[2];
	 if ($x =~ /,/){
	     @d = split /,/,$x;
	     if ($d[0] =~ /\d/){
		 push (@b,$d[0]);
	     }elsif ($d[1] =~ /\d/){push (@b,$d[1]);}else {push (@b,$d[2]);}
	 }else {next;}
     }
     return @b;
}