#!user/bin/perl
use utf8;
binmode(STDOUT,":encoding(gbk)");
#It's a programming language for AI!
#---------------OUR_ARGU---------------#
our @SAN; #This is a pool to press arguments.
our @LNS; #Lines of the script.
our %FNT; #Hash for sonsub.
#----------------MAIN_SUB---------------#
print("Using Vson-Runner V1.0...\n");
print(Bra('Bis(nihao(boy))','(',')')); #Just a debug.
print("Inputting the path of the file: VsonScript\n");
open DATA,<STDIN>;#All lines was saved in this list!
<STDIN>;
#---------------BRACKERTER--------------#
sub Bra{
	my $M_CODE=$_[0];
	my $F_CHAR=$_[1];
	my $E_CHAR=$_[2];
	my @M_CODE=split(//,$M_CODE);
	my $CNTR;
	my $S_C;
	my $ALL;
	for($i=1;$i<@M_CODE;$i+=1){
		if(index(@M_CODE[$i],$F_CHAR) ne -1){
			$CNTR+=1;
			$S_C+=1;
			$ALL+=1;
		}
		elsif(index(@M_CODE[$i],$E_CHAR) ne -1){
			$CNTR-=1;
			$S_C+=1;
			$ALL+=1;
		}
		else{
			$ALL+=1;
		}
		if($S_C > 0 && $CNTR == 0){
			return $ALL;
		}
	}
}
#--------------MIDER-------------------#
sub Mid{
	my $STR=$_[0];
	return substr($STR,index($STR,"(")+1,Bra($STR,"(",")")-index($STR,"(")-1);
}
#-------------TOKENR-------------------#
sub Tok{
	
}
#-------------RUNNER-------------------#
sub Run{
	my $CODE=$_[0];
	
}
#------------SANNER------------------#
sub San{
	
}
