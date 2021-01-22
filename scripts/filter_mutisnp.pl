#!/usr/bin/perl -w
use Switch; 
my (@a,@b);
my ($count,$m,$n);

while (<>){
    chomp();
    if (/^#/){
	print "$_\n";
    }else {
	@a = split(/\t/,$_);
	$count = 0;

	foreach $index (9 .. $#a){
		$m = (split(/:/,$a[$index]))[2];
		if ($m !~ /,/){
			if (($m =~ /\d/) && ($m >0.01)){
		    $count ++;
		 }
		}else {
			@b = split(/,/,$m);
			$n=@b;
			switch ($n){
				case 2   {if (($b[0] =~ /\d/) || ($b[1] =~ /\d/)) {$count ++;}}
				case 3     {if (($b[0] =~ /\d/) || ($b[1] =~ /\d/)|| ($b[2] =~ /\d/)) {$count ++;}}
			}

	 }
	}




	if($count >(($#a-9)*0.05)/1){
	    $a=join ("\t",@a);
	    print "$a\n";
	}else{
		next;
	}
}
}   

