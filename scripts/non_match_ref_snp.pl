#!/usr/bin/perl -w
use Switch; 
my (@ref,@a,@b,@count);
my ($m,$n);
my %hash;
open REF,"<$ARGV[0]";
while (<REF>){
    chomp;
    if (/^#/){
	next;
    }else {
	@ref=split /\t/,$_;
	$hash{$ref[1]}="$ref[3]\t$ref[4]";
    }
}
close REF;


open IN,"<$ARGV[1]";
while (<IN>){
    chomp;
    if (/^#CHROM/){
        s/#//;
	@a=split /\t/,$_;
	foreach (0 .. $#a){
	    if($a[$_] !~ /ID|QUAL|FILTER|INFO|FORMAT/){
		if ($_!=$#a){
		    print "$a[$_]\t";
		}else {
		    print "$a[$_]\n";
		}
	    }
	}
    }else {
        @a=split /\t/,$_; 
        if (!exists $hash{$a[1]}){
	    if ($a[4] !~ /,/){
                foreach  $index (9 .. $#a){
                    $m = (split (/:/,$a[$index]))[2];
                    if ($m=~/\d/){
                        push(@b,$m);
                    }else {
			push(@b,"NA");
		    }                              
                }
            print "$a[0]\t$a[1]\t$a[3]\t$a[4]";
            foreach (@b){
		$_="\t$_";
	    }
	    $b[$#b] .= "\n";
	    foreach (@b){
		print $_;
	    }
            @b=();
                           
            }else {
		@count = split(/,/,$a[4]);
		$n=@count;
		switch ($n){
		    case 2    {@b=&f2(@a); print "$a[0]\t$a[1]\t$a[3]\t$a[4]"; foreach (@b){$_="\t$_";} $b[$#b] .= "\n"; foreach (@b){print $_;}  @b=();} 
		    case 3    {@b=&f3(@a); print "$a[0]\t$a[1]\t$a[3]\t$a[4]"; foreach (@b){$_="\t$_";} $b[$#b] .= "\n"; foreach (@b){print $_;}  @b=();}
		}

	    }
        }
        
    
    }
}
close IN;

sub f2{
    my (@c,@d);
    foreach  $index (9 .. $#_){
	my $x = (split (/:/,$_[$index]))[2];
	if ($x !~ /,/){
	    push (@c,"NA");
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
	     push (@c,"NA");
	 }else {
	     @d = split /,/,$x;
	     if ($d[0] =~ /\d/){
		 push (@c,$d[0]);
	     }elsif ($d[1] =~ /\d/){push (@c,$d[1]);}else {push (@c,$d[2]);}
	 }
     }
     return @c;
}
