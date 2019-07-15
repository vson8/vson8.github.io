#!user/bin/perl
#It's a programming language for AI!
#---------------OUR_ARGU---------------#
use utf8;
binmode(STDOUT,":encoding(gbk)");
our $ip=0;
our $MOD;
our $POS=0;
our $TmpPos;
our %VARPOOL=('CTRL'=>'CAIXUKUN','Door'=>'Oh! Boy next door!'); #FUNNY CONSTANT!!!
our %Fns;
   	  our $TIME;
   	  our $HEN;
   	  our $CMod;
   	  our $T;
   	  our $Cntr=0;
   	  our $Sin;
our $BMOD;
our $BNAME;
our $MMod;
#----------------MAIN_SUB---------------
open DATA,<STDIN>;#All lines was saved in this list!
our @DATA=<DATA>;
Run($DATA[0]);
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
#----------LINE_FINDER---------------#
sub Fin{
   	my $Target=$_[0];
	for($w=0;$w<@DATA;$w+=1){
		if(index($DATA[$w],$Target) != -1){
			return $w;
		}
	}
}
#------------LRACKETER---------------#
sub Lra{
	my $F_CHAR=$_[0];
	my $E_CHAR=$_[1];
	my $SOP=$POS; #Temple position...
	my $S_C=0;
	my $CNTR=0;
	my $BOOL=1;
	while($BOOL==1){
		if(index($DATA[$SOP],$F_CHAR) == -1 && index($DATA[$SOP],$E_CHAR) == -1){
			
			$SOP+=1;
			
		}
		elsif(index($DATA[$SOP],$F_CHAR) != -1){
			
			$CNTR+=1;
			$S_C+=1;
			$SOP+=1;
			
		}
		elsif(index($DATA[$SOP],$E_CHAR) != -1){
			
			$CNTR-=$CNTR;
			$S_C+=1;
			$SOP+=1;
			
		}

		if($S_C>0 && $CNTR == 0){
			return $SOP-1;
			$BOOL=0;
		}
	}
}
#-------------TOKENR-------------------#
sub Tok{
	my $LINE=$_[0];
	my $CHAR;
	my $CNTR=0;
	my $AFTR;
    for($i=0;$i<length($LINE);$i+=1){
    	$CHAR=substr($LINE,$i,1);
    	if($CHAR eq "("){
    		$CNTR+=1;
    	}
    	if($CHAR eq ")"){
    		$CNTR-=1;
    	}
    	if($CHAR eq "," && $CNTR==0){
    		$CHAR="%%";
    	}
    	$AFTR=$AFTR.$CHAR;
    }
    @INNER=split("%%",$AFTR);
    return @INNER;
}
#-------------RUNNER-------------------#
sub Run{
	my @SAN;
	my $TMP;
	my $CODE=$_[0];
	if(index($CODE,"Bark(") ne -1){
		@SAN=Tok(Mid($CODE));
		$SAN[0]=San($SAN[0]);
		$SAN[1]=San($SAN[1]);
		$SAN[2]=San($SAN[2]);
		$SAN[3]=San($SAN[3]);
		$SAN[4]=San($SAN[4]);
		$SAN[5]=San($SAN[5]);
		$SAN[6]=San($SAN[6]);
		$SAN[7]=San($SAN[7]);
		$SAN[8]=San($SAN[8]);
		$SAN[9]=San($SAN[9]);
		print($SAN[0].$SAN[1].$SAN[2].$SAN[3].$SAN[4].$SAN[5].$SAN[6].$SAN[7].$SAN[8].$SAN[9]);
		$POS=$POS+1;
		Run($DATA[$POS]);
	}
	if(index($CODE,"Say(") ne -1){
		@SAN=Tok(Mid($CODE));
		$SAN[0]=San($SAN[0]);
		$SAN[1]=San($SAN[1]);
		if($BMOD==1){
		if($MMod==1){
   	    $SAN[0]=~ s/me./$BNAME./;
	    }else{
	    $SAN[0]=~ s/me./$BNAME:/;
	    }
		$VARPOOL{"$SAN[0]"}="$SAN[1]";
		}else{
		$VARPOOL{"$SAN[0]"}="$SAN[1]";}
		$POS=$POS+1;Run($DATA[$POS]);
   }
   if(index($CODE,"If") != -1){
   	    $SAN=Mid($CODE);
   	    $SAN=San($SAN);
   	    if($SAN eq "+"){
   	    	$ENDPOS=Lra("If","Fi");
   	    	$DATA[Lra("If","Else")]="Goto($ENDPOS)";
   	    	$POS=$POS+1;
   	    	Run($DATA[$POS]);
   	    }
   	    if($SAN eq "-"){
   	    	$POS=Lra("If","Else")+1;
   	    	Run($DATA[$POS]);
   	    }
   }
   if(index($CODE,"Else") != -1){
   	       if($MOD eq "ture"){
   	       	$POS=Lra("If","Fi")+1;
   	       	$MOD="false";
   	       }
   	       Run($DATA[$POS]);
   }
   if(index($CODE,"Fi") != -1){
   	        $POS+=1;Run($DATA[$POS]);
   }
   if(index($CODE,"Orp") != -1){
   	        $POS=$TmpPos;Run($DATA[$POS]);
   }
   if(index($CODE,"Jump") != -1){
   	        $POS+=1;Run($DATA[$POS]);
   }
   if(index($CODE,"Goto(") != -1){
		$SAN=(Mid($CODE));
		$SAN=San($SAN);
		$POS=$SAN;
		Run($DATA[$POS]);
   }
   if(index($CODE,"Pro(") != -1){
   	   $SAN=Mid($CODE);
	   if($BMOD==1){
	   if($MMod==1){
   	   $SAN=~ s/$TmpName:/$BNAME./;
	   }else{
	   $SAN=~ s/me./$BNAME:/;
	   }
	   $DATA[$POS]="Pro(".$SAN.")";
	   }else{
	   $Function_Name=San($SAN);}
   	   $POS=Lra("Pro","Orp")+1;
      
   	   Run($DATA[$POS]);
   	   
   }
   if(index($CODE,"Go(") != -1){
   	  @SAN=Tok(Mid($CODE));
   	  
   	  $w=0;
   	  for($i=1;$i<@SAN;$i+=1){
   	  	$w+=1;

   	  	$VARPOOL{"$SAN[0].$w"}=San($SAN[$i]);
}
   	  $TmpPos=$POS+1;
   	  $POS=Fin("Pro(".$SAN[0])+1;
   	  Run($DATA[$POS]);
   }
   if(index($CODE,"Send(") != -1){
   	  $SAN=Mid($CODE);
   	  $VARPOOL{$Function_Name.".Back"}=San($SAN);
   	 
   }
   if(index($CODE,"Re(") != -1){
   	  @SAN=Tok(Mid($CODE));
   	  $TIME=San($SAN[0])-2;
   	  $HEN=San($SAN[1]);
   	  if($SAN[2] == 0){$Sin=1;}else{$Sin=San($SAN[2]);}
   	  $CMod=1;
   	  $T=$POS+1;
   	  $Cntr=0;
   	  Run($DATA[$T]);
   }
   if(index($CODE,"Er") != -1){

   	  if($Cntr==$TIME){
   	  	$CMod=0;
   	  	$POS+=1;
   	  	Run($DATA[$POS]);
   	  }
   	   if($CMod==1){
   	  	$Cntr=$Cntr+$Sin;
   	  	$POS=$T;
		$VARPOOL{$HEN}=$Cntr;
   	  	Run($DATA[$POS]);
   	  }
   }
   if(index($CODE,"~(") != -1){
   $SAN=Mid($CODE);
   eval($SAN);
   $POS+=1;Run($DATA[$POS]);
   }
   if(index($CODE,"Box(") != -1){
   @SAN=Tok(Mid($CODE));
   $BMOD=1;
   if($MMod != 1){
   $BNAME=$SAN[0];
   }else{
   $TmpName=$SAN[0];
   $BNAME=$DNAME;}
   $POS+=1;Run($DATA[$POS]);
   }
   if(index($CODE,"Xob") != -1){
   if($MMod==1){
   $BMOD=0;
   $BNAME="";
   $MMod=0;
   $POS=$TemPos+1;Run($DATA[$POS]);
   }else{
   $BMOD=0;
   $BNAME='';
   $POS+=1;Run($DATA[$POS]);
   }
   }
   if(index($CODE,"Make(") != -1){
   @SAN=Tok(Mid($CODE));
   $TemPos=$POS;
   $MMod=1;
   $POS=Fin("Box(".$SAN[1]);
   $DNAME=$SAN[0];
   Run($DATA[$POS]);
   }
 }
#------------SANNER------------------#
sub San{
	my $CODE=$_[0];
	my @SAN;
		   if(index($CODE,"Eqs(") ne -1){
   	 @SAN=Tok(Mid($CODE));
   	 $SAN[0]=San($SAN[0]);
   	 $SAN[1]=San($SAN[1]);
	  if($SAN[0] == $SAN[1] or $SAN[0] eq $SAN[1]){
	  	return "+";
	  	}else{
	  	return "-";
	  	}
   }
   if(index($CODE,"Go(") != -1){
   	  @SAN=Tok(Mid($CODE));
   	  $w=0;
   	  for($i=1;$i<@SAN;$i+=1){
   	  	$w+=1;
   	  	$VARPOOL{"$SAN[0].$w"}="$SAN[$i]";
   	  }
   	  $TmpPos=$POS+1;
   	  $POS=Fin("Pro(".$SAN[0])+1;
   	  Run($DATA[$POS]);
   	  return $VARPOOL{$Function_Name.".Back"};
   }


	if(index($CODE,"&(") ne -1){
		$SAN=Mid($CODE);
		$SAN=San($SAN);
		
		return $VARPOOL{"$SAN"};
   }
   if(index($CODE,"Get(") ne -1){
   $Stdin=<STDIN>;
   $Stdin=~ s/\n//;#Kill endl!
   	return $Stdin;
   }
   if($CODE==748){
   	return "-";
   }
   if($CODE==520){
   	return "+";
   }
   if($CODE eq "#n"){
   	return "\n";
   }
   if(index($CODE,"~") != -1){
   $SAN=Mid($CODE);
   return eval($SAN);
   }
   else{return $CODE;}
}