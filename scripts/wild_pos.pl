#!/usr/bin/perl -w
use Switch; 
my (@a,@b,@count);
my ($m,$n);
while (<>){
    chomp;
    if (/^#CHROM/) {
        @a=split /\t/,$_;
        print "$a[0]\t$a[1]\t$a[3]\t$a[4]\t";
        foreach (9 .. $#a){
            if ($_!=$#a){
                print "$a[$_]\t";
            }else {
                print "$a[$_]\n";
                }
	        }
    }else {
        @a=split /\t/,$_; 
	    if ($a[4] !~ /,/){
            foreach  $index (9 .. $#a){
                $m = (split (/:/,$a[$index]))[2];
                if ($m=~/\d/){
                    push(@b,$m);
                }else {
			        push(@b,"");
		                }                              
                }  
            print "$a[0]\t$a[1]\t$a[3]\t$a[4]";     
            foreach  $index (0 .. $#b){
                if ($index != $#b){ print "$b[$index]\t";}else {print "$b[$index]\n";}
            }
            @b=();
                           
        }else {
            @count = split(/,/,$a[4]);
            $n=@count;
            switch ($n){
                case 2    {@b=&f2(@a); print "$a[0]\t$a[1]\t$a[3]\t$a[4]"; foreach $index (0 .. $#b){if ($index != $#b){ print "$b[$index]\t";}else {print "$b[$index]\n";}}  @b=();} 
                case 3    {@b=&f3(@a); print "$a[0]\t$a[1]\t$a[3]\t$a[4]"; foreach $index (0 .. $#b){if ($index != $#b){ print "$b[$index]\t";}else {print "$b[$index]\n";}}  @b=();}
                }
	        }
        }
        
}

sub f2{
    my (@c,@d);
    foreach  $index (9 .. $#_){
	my $x = (split (/:/,$_[$index]))[2];
	if ($x !~ /,/){
	    push (@c,"");
	}else {
	    @d = split /,/,$x;
	    if ($d[0] =~ /\d/){
		push (@c,$d[0]);
	    }else {
		push (@c,$d[1]);
	    }
	}
    }
    return @c;

}

sub f3{
     my (@c,@d);
     foreach  $index (9 .. $#_){
	 my $x = (split (/:/,$_[$index]))[2];
	 if ($x !~ /,/){
	     push (@c,"");
	 }else {
	     @d = split /,/,$x;
	     if ($d[0] =~ /\d/){
		 push (@c,$d[0]);
	     }elsif ($d[1] =~ /\d/){push (@c,$d[1]);}else {push (@c,$d[2]);}
	 }
     }
     return @c;
}