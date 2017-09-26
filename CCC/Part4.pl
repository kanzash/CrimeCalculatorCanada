	#!/usr/bin/perl

#

#   Packages and modules

#

use strict;

use Switch;

use warnings;

use Statistics::R;

use version;   our $VERSION = qv('5.16.0');   # This is the version of Perl to be used

use Text::CSV  1.32;   # We will be using the CSV module (version 1.32 or higher)

                       # to parse each line





my $EMPTY = q{};

my $SPACE = q{ };

my $COMMA = q{,};



my $filename     = $EMPTY;

my $filename_two;

my @records;

my $statNum = 0;

my @geo;

my @prov;

my @topic;

my @characteristic;

my @note;

my @total;

my @flag_total;

my @male_total;

my @male_flag;

my @female_total;

my @female_flag;

my @english;

my @french;

my @other;

my @native;

my @nonNative;

my @totalpop;

my @provinces = 0;

#my @languages;



my @value;

my $csv          = Text::CSV->new({ sep_char => $COMMA });



$filename = "censusdata.csv";



open my $names_fh, '<', $filename or die "Unable to open names file: $filename\n";

@records = <$names_fh>;



close $names_fh or

   die "Unable to close: $filename\n";  



foreach my $stat ( @records ) {

  

 if ( $csv->parse($stat) ) {

     

	 my @master_fields = $csv->fields();

      

      $statNum++;

      

      $geo[$statNum]= $master_fields[0];

      $prov[$statNum] = $master_fields[1];

      $topic[$statNum] = $master_fields[2];

      $characteristic[$statNum]=$master_fields[3];

      $total[$statNum]=$master_fields[5];  

	      

   }



}


my $a =2;

my $b =3;

my $c =130;

my $d =131;

my $e =132;

my $j =0;


for($j=0; $j<14; $j=$j +1){

	

	$english[$j]= $total[$c];

	$c = $c +134;

}



for($j=0; $j<14; $j=$j+1){

	

	$french[$j]=$total[$d];

	$d = $d +134;

}



for($j=0; $j<14; $j=$j+1){



	$other[$j]=$total[$e];

	$e=$e+134;

}



for($j=0; $j<14; $j=$j+1){



	$totalpop[$j]= $english[$j] + $french[$j] + $other[$j];



}







for($j=0; $j<14; $j=$j+1){



	$native[$j] = ((($english[$j]+$french[$j])/$totalpop[$j])*100);

	$nonNative[$j] = ((($other[$j])/$totalpop[$j])*100);



}

$provinces[0] = 'CAN'; 
$provinces[1] = 'NFLD'; 
$provinces[2] = 'PEI'; 
$provinces[3] = 'NS'; 
$provinces[4] = 'NB'; 
$provinces[5] = 'QBC'; 
$provinces[6] = 'ONT'; 
$provinces[7] = 'MTB'; 
$provinces[8] = 'SASK'; 
$provinces[9] = 'ALBT'; 
$provinces[10] = 'BC'; 
$provinces[11] = 'YKN'; 
$provinces[12] = 'NWT'; 
$provinces[13] = 'NNVT'; 



print "Choose to see stats for a province or territory or Canada\n";

print "1.Canada\n2.Newfoundland & Labrador\n3.Prince Edward Island\n4.Nova Scotia\n5.New Brunswick\n6.Quebec\n7.Ontario\n8.Manitoba\n9.Saskatchewan\n10.Alberta\n11.British Columbia\n12.Yukon\n13.Northwest Territories\n14.Nunavut\n";

my $pro_input;

my $pro_input_num;

my $valid = 0; 



while ($valid == 0 ) {

$pro_input_num = <>;	

chomp $pro_input_num;



switch($pro_input_num) {

	

	case 1	{$pro_input = 'Canada'; $valid = 1;}

	case 2	{$pro_input = 'Newfoundland & Larador'; $valid = 1;}

	case 3	{$pro_input = 'Prince Edward Island'; $valid = 1;}

	case 4	{$pro_input = 'Nova Scotia'; $valid = 1;}

	case 5	{$pro_input = 'New Brunswick'; $valid = 1;}

	case 6	{$pro_input = 'Quebec'; $valid = 1;}

	case 7	{$pro_input = 'Ontario'; $valid = 1;}

	case 8	{$pro_input = 'Manitoba'; $valid = 1;}

	case 9	{$pro_input = 'Saskatchewan'; $valid = 1;}

	case 10	{$pro_input = 'Alberta'; $valid = 1;}

	case 11	{$pro_input = 'British Columbia'; $valid = 1;}

	case 12	{$pro_input = 'Yukon'; $valid = 1;}

	case 13	{$pro_input = 'Northwest Territories'; $valid = 1;}

	case 14	{$pro_input = 'Nunavut'; $valid = 1;}

	else{

		print "Incorrect selection, try again: "; 

		$valid = 0;

	}

	

}

}

print "Would you like to look at the Native(1) or non-Native(2)?\n";

my $lang_input = 0;

my $valid_two = 0;



while($valid_two == 0){

$lang_input= <>;

chomp $lang_input; 



if ($lang_input eq 1){

	if($pro_input_num == 1){

	print "Looking at all crime violations in Canada there was ".$native[$pro_input_num - 1]."% native speakers.\n";

        $valid_two = 1;

	}

	else{	

	print "Looking at all crime violations in ".$pro_input." there was ".$native[$pro_input_num - 1]."% native speakers.\n";

	$valid_two = 1;

	}

}



elsif ($lang_input eq 2){

	if($pro_input_num == 1){

        print "Looking at all crime violations in Canada  there were ".$nonNative[$pro_input_num - 1]."% non-Native speakers.\n";

        $valid_two = 1;

        }

        else{

        print "Looking at all crime violations in ".$pro_input." there were ".$nonNative[$pro_input_num - 1]."% non-Native speakers.\n";

        $valid_two = 1;

        }

}



else{

	print "Wrong Input! Please type (1) for Native or (2) for non-Native\n";

	$valid_two = 0;

}

}


#Graphing

{

open my $filename_add, '>', 'languagedata.csv';

print {$filename_add} 'Province'.",".'Value'."\n";

for (my $z = 0;$z < 13; $z++){
if($lang_input == 1){print {$filename_add} $provinces[$z].",".$native[$z]."\n";}
if($lang_input == 2){print {$filename_add} $provinces[$z].",".$nonNative[$z]."\n";}

}
close $filename_add;


my $R = Statistics::R->new();

$filename_two = "langdata.pdf";

$R->run(qq'pdf("$filename_two", paper="letter")');
$R->run(q'library(ggplot2)');
$R->run(qq'langdata<-read.csv("languagedata.csv")');
$R->run(q'ggplot(langdata, aes(x=Province, y=Value)) + geom_bar(stat = "identity", width=0.5, color="blue", fill=rgb(0.1,0.4,0.5,0.7)) + ggtitle("% of Native/Non-Native Speakers") + labs(x="Province", y="Value")');
$R->run(q'dev.off()');
$R->stop();
}

