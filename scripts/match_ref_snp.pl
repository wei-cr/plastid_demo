#!/usr/bin/perl -w
my (@ref,@a,@b);
my $m;
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
        if (exists $hash{$a[1]} && ("$a[3]\t$a[4]" eq $hash{$a[1]})) {
            foreach  $index (9 .. $#a){
                $m = (split (/:/,$a[$index]))[2];
                if ($m=~/\d/){
                    push(@b,$m);
                    }else{
			push(@b,"");
		    }                              
                }
            print "$a[0]\t$a[1]\t$a[3]\t$a[4]";
            foreach (@b){
		$_="\t$_";
	    }
	    $b[$#b].= "\n";
	    foreach (@b){
		print $_;
	    }
            @b=();                
            

	    }
        }
        
    }
close IN;
