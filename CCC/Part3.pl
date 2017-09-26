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
my @records;
my $statNum = 0;
my @geo;
my @prov;
my @total;
my $a = 0;
my $b = 0;
my @single_parent = 0;
my @common_law = 0;
my @married = 0;
my @nuclear = 0;
my @non_nuclear = 0;
my @census_house = 0;
my @ratio = 0;
my @province = 0;
my @singleratio = 0;
my @marriedratio = 0;
my @commonratio = 0;
my $filename2     = $EMPTY;
my @records2;
my $statNum2 = 0;
my @total2;
my $a2 = 0;
my $b2 = 0;
my @single_parent2 = 0;
my @common_law2 = 0;
my @married2 = 0;
my @nuclear2 = 0;
my @non_nuclear2 = 0;
my @census_house2 = 0;
my @ratio2 = 0;
my @province2 = 0;
my @singleratio2 = 0;
my @marriedratio2 = 0;
my @commonratio2 = 0;
my $filename3     = $EMPTY;
my @records3;
my $statNum3 = 0;
my @total3;
my $a3 = 0;
my $b3 = 0;
my @single_parent3 = 0;
my @common_law3 = 0;
my @married3 = 0;
my @nuclear3 = 0;
my @non_nuclear3 = 0;
my @census_house3 = 0;
my @ratio3 = 0;
my @province3 = 0;
my @singleratio3 = 0;
my @marriedratio3 = 0;
my @commonratio3 = 0;

my $pdffilename3;

my $pdffilename2;

my $pdffilename;









my @value;
my $csv          = Text::CSV->new({ sep_char => $COMMA });

$filename = "censusdata11.csv";

open my $names_fh, '<', $filename or die "Unable to open names file: $filename\n";
@records = <$names_fh>;

close $names_fh or
   die "Unable to close: $filename\n";  

foreach my $stat ( @records ) {
  
 
 if ( $csv->parse($stat) ) {
     
	 my @master_fields = $csv->fields();
      
      
   ##   $geo[$statNum]= $master_fields[0];
      $prov[$statNum] = $master_fields[1];
   ##   $topic[$statNum] = $master_fields[2];
   ##   $characteristic[$statNum]=$master_fields[3];
	##  $note[$statNum]=$master_fields[4];
	  $total[$statNum]=$master_fields[5];  
	##  $flag_total[$statNum]=$master_fields[6];  
	##  $male_total[$statNum]=$master_fields[7]; 
	##  $male_flag[$statNum]=$master_fields[8]; 
	 ## $female_total[$statNum]=$master_fields[9]; 
	 ## $female_flag[$statNum]=$master_fields[10]; 
      $statNum++;
	  
  
   }

}

$province[0] = 'CAN'; 
$province[1] = 'NFLD'; 
$province[2] = 'PEI'; 
$province[3] = 'NS'; 
$province[4] = 'NB'; 
$province[5] = 'QBC'; 
$province[6] = 'ONT'; 
$province[7] = 'MTB'; 
$province[8] = 'SASK'; 
$province[9] = 'ALBT'; 
$province[10] = 'BC'; 
$province[11] = 'YKN'; 
$province[12] = 'NWT'; 
$province[13] = 'NNVT'; 


## Adding non-nuclear family conditions for each province

$a=63; ## Hardcoded line number for start of single parent families with children

## Find number of single parent families with children

 for($b=0;$b<14;$b = $b + 1){
	
	 $single_parent[$b] = $total[$a];
     $a = $a + 134
}


$a=59;  ## Hardcoded line number for start of common law families with children

## Find number of common law families with children

 for($b=0;$b<14;$b = $b + 1){
	
	 $common_law[$b] = $total[$a];
     $a = $a + 134
}

$a=53;  ## Hardcoded line number for start of married (same and opposite sex) families with children

## Find total of number of traditionally married families with children

 for($b=0;$b<14;$b = $b + 1){
	
	 $married[$b] = $total[$a];
     $a = $a + 134
}

for($b=0;$b<14;$b = $b + 1){

	$non_nuclear[$b] = $single_parent[$b] + $common_law[$b];
	$census_house[$b] = $single_parent[$b] + $common_law[$b] + $married[$b];
    $ratio[$b] = ($non_nuclear[$b]/$census_house[$b]) * 100;
	$singleratio[$b] = ($single_parent[$b] / $census_house[$b]) * 100;
	$commonratio[$b] = ($common_law[$b] / $census_house[$b]) * 100;
	$marriedratio[$b] = ($married[$b] / $census_house[$b]) * 100;
	
	
	##$youth_crime[$b] = ##youthcrime//totalcrime;

}

for($b=0; $b<14; $b = $b + 1){
	
	
    ##print "In $province[$b], $ratio[$b]% of families with children at home are non-conjugal\n";
	##print $youth_crime[$b] = ##youthcrime//totalcrime;
	
	
}







my @value2;
my $csv2          = Text::CSV->new({ sep_char => $COMMA });

$filename2 = "censusdata6.csv";

open my $names_fh2, '<', $filename2 or die "Unable to open names file: $filename2\n";
@records2 = <$names_fh2>;

close $names_fh2 or
   die "Unable to close: $filename2\n";  

foreach my $stat2 ( @records2 ) {
  
 
 if ( $csv2->parse($stat2) ) {
     
	 my @master_fields2 = $csv2->fields();
      
      
   ##   $geo[$statNum]= $master_fields[0];
   ##   $topic[$statNum] = $master_fields[2];
   ##   $characteristic[$statNum]=$master_fields[3];
	##  $note[$statNum]=$master_fields[4];
	  $total2[$statNum2]=$master_fields2[1];  
	##  $flag_total[$statNum]=$master_fields[6];  
	##  $male_total[$statNum]=$master_fields[7]; 
	##  $male_flag[$statNum]=$master_fields[8]; 
	 ## $female_total[$statNum]=$master_fields[9]; 
	 ## $female_flag[$statNum]=$master_fields[10]; 
      $statNum2++;
	  
  
   }

}


## Adding non-nuclear family conditions for each province

$a2=70; ## Hardcoded line number for start of single parent families with children

## Find number of single parent families with children

 for($b2=0;$b2<14;$b2 = $b2 + 1){
	
	 $single_parent2[$b2] = $total2[$a2];
     $a2 = $a2 + 2169;
}


$a2=66;  ## Hardcoded line number for start of common law families with children

# Find number of common law families with children

 for($b2=0;$b2<14;$b2 = $b2 + 1){
	
	 $common_law2[$b2] = $total2[$a2];
     $a2 = $a2 + 2169;
  }

$a2=60;  ## Hardcoded line number for start of married (same and opposite sex) families with children

## Find total of number of traditionally married families with children

for($b2=0;$b2<14;$b2 = $b2 + 1){
	
	 $married2[$b2] = $total2[$a2];
     $a2 = $a2 + 2169;
  }

for($b2=0;$b2<14;$b2 = $b2 + 1){

	$non_nuclear2[$b2] = $single_parent2[$b2] + $common_law2[$b2];
	$census_house2[$b2] = $single_parent2[$b2] + $common_law2[$b2] + $married2[$b2];
    $ratio2[$b2] = ($non_nuclear2[$b2]/$census_house2[$b2]) * 100;
	$singleratio2[$b2] = ($single_parent2[$b2] / $census_house2[$b2]) * 100;
	$commonratio2[$b2] = ($common_law2[$b2] / $census_house2[$b2]) * 100;
	$marriedratio2[$b2] = ($married2[$b2] / $census_house2[$b2]) * 100;
	
}



my @value3;
my $csv3          = Text::CSV->new({ sep_char => $COMMA });

$filename3 = "census01.csv";

open my $names_fh3, '<', $filename3 or die "Unable to open names file: $filename3\n";
@records3 = <$names_fh3>;

close $names_fh3 or
   die "Unable to close: $filename3\n";  

foreach my $stat3 ( @records3 ) {
  
 
 if ( $csv3->parse($stat3) ) {
     
	 my @master_fields3 = $csv3->fields();
      
      
   ##   $geo[$statNum]= $master_fields[0];
   ##   $topic[$statNum] = $master_fields[2];
   ##   $characteristic[$statNum]=$master_fields[3];
	##  $note[$statNum]=$master_fields[4];
	  $total3[$statNum3]=$master_fields3[1];  
	##  $flag_total[$statNum]=$master_fields[6];  
	##  $male_total[$statNum]=$master_fields[7]; 
	##  $male_flag[$statNum]=$master_fields[8]; 
	 ## $female_total[$statNum]=$master_fields[9]; 
	 ## $female_flag[$statNum]=$master_fields[10]; 
      $statNum3++;
  }

}


## Adding non-nuclear family conditions for each province

$a3=25; ## Hardcoded line number for start of single parent families with children

## Find number of single parent families with children

 for($b3=0;$b3<14;$b3 = $b3 + 1){
	
	 $single_parent3[$b3] = $total3[$a3];
     $a3 = $a3 + 91;
}


$a3=21;  ## Hardcoded line number for start of common law families with children

# Find number of common law families with children

 for($b3=0;$b3<14;$b3 = $b3 + 1){
	
	 $common_law3[$b3] = $total3[$a3];
     $a3 = $a3 + 91;
	 
  }

$a3=15;  ## Hardcoded line number for start of married (same and opposite sex) families with children

## Find total of number of traditionally married families with children

for($b3=0;$b3<14;$b3 = $b3 + 1){
	
	 $married3[$b3] = $total3[$a3];
     $a3 = $a3 + 91;
 
}

for($b3=0;$b3<14;$b3 = $b3 + 1){

	$non_nuclear3[$b3] = $single_parent3[$b3] + $common_law3[$b3];
	$census_house3[$b3] = $single_parent3[$b3] + $common_law3[$b3] + $married3[$b3];
    $ratio3[$b3] = ($non_nuclear3[$b3]/$census_house3[$b3]) * 100;
	$singleratio3[$b3] = ($single_parent3[$b3] / $census_house3[$b3]) * 100;
	$commonratio3[$b3] = ($common_law3[$b3] / $census_house2[$b3]) * 100;
	$marriedratio3[$b3] = ($married3[$b3] / $census_house3[$b3]) * 100;
	
	
}


print "Choose your census year, or compare all years.\n";
print "1.2001\n2.2006\n3.2011\n4.Compare All Census Years\n";
my $census1;
my $trait1;
my $delete;

my $valid = 0;


while ( $valid == 0 ) {

$census1 = <>;
chomp $census1;

switch($census1) {
	
	case 1	{$census1 = 1; $valid = 1;}
	case 2	{$census1  = 2; $valid = 1;}
	case 3	{$census1  = 3; $valid = 1;}
	case 4	{$census1  = 4; $valid = 1;}

	else	{print "Incorrect selection, try again: "; $valid = 0}
	
}
}
print "Choose your Familial trait, or compare all traits.\n";
print "1. % of Non-Conjugal Families\n2. % of Single Parent  \n3. % of Common Law Families\n4. % of Conjugal Families\n5. Compare all familial traits \n";
$valid = 0;


while ( $valid == 0 ) {

$trait1 = <>;
chomp $trait1;

switch($trait1) {
	
	case 1	{$trait1 = 1; $valid = 1;}
	case 2	{$trait1  = 2; $valid = 1;}
	case 3	{$trait1  = 3; $valid = 1;}
	case 4	{$trait1  = 4; $valid = 1;}
	case 5	{$trait1  = 5; $valid = 1;}
	

	else	{print "Incorrect selection, try again: "; $valid = 0}
	
}

}


print "Do you want to delete the output data after the program is complete?\n";
print "1.Yes\n2.No \n";


$valid = 0;


while ( $valid == 0 ) {

	$delete = <>;
	chomp $delete;

switch($delete) {
	
	case 1	{$delete = 1; $valid = 1;}
	case 2	{$delete  = 2; $valid = 1;}

	else	{print "Incorrect selection, try again: "; $valid = 0}
	
}

}


open my $fh, '>', 'output.csv';
print {$fh} 'Province'.",".'Ratio'.",".'NonNuclear'.",".'SingleParent'.",".'Married'.",".'CommonLaw'.",".'Year'."\n";	

for($b=0; $b<14; $b = $b + 1){
	
	
	if($census1 == 3){print {$fh} $province[$b].",".$ratio[$b].",".$non_nuclear[$b].",".$singleratio[$b].",".$marriedratio[$b].",".$commonratio[$b].",".'2011 Census'."\n";}
	if($census1 == 2){print {$fh} $province[$b].",".$ratio2[$b].",".$non_nuclear2[$b].",".$singleratio2[$b].",".$marriedratio2[$b].",".$commonratio2[$b].",".'2006 Census'."\n";}
	if($census1 == 1){print {$fh} $province[$b].",".$ratio3[$b].",".$non_nuclear3[$b].",".$singleratio3[$b].",".$marriedratio3[$b].",".$commonratio3[$b].",".'2001 Census'."\n";}
	if($census1 == 4){print {$fh} $province[$b].",".$ratio[$b].",".$non_nuclear[$b].",".$singleratio[$b].",".$marriedratio[$b].",".$commonratio[$b].",".'2011 Census'."\n";
	print {$fh} $province[$b].",".$ratio2[$b].",".$non_nuclear2[$b].",".$singleratio2[$b].",".$marriedratio2[$b].",".$commonratio2[$b].",".'2006 Census'."\n";
	print {$fh} $province[$b].",".$ratio3[$b].",".$non_nuclear3[$b].",".$singleratio3[$b].",".$marriedratio3[$b].",".$commonratio3[$b].",".'2001 Census'."\n";}	
			
}

close $fh;



# Create a communication bridge with R and start R
my $R = Statistics::R->new();

$pdffilename = "outputcensus.pdf";


# Set up the PDF file for plots
$R->run(qq`pdf("$pdffilename" , paper="letter")`);

# Load the plotting library
$R->run(q`library(ggplot2)`);


# read in data from a CSV file
$R->run(qq`data <- read.csv("output.csv")`);


# plot the ratio of ratio of non-nuclear households with children
if($trait1==1){$R->run(q`ggplot(data, aes(Province,Ratio, fill=Year)) + geom_bar(stat="identity", position = "dodge", width=0.7,) + ggtitle("% of Households With Children at Home from Non-Conjugal Families")+ labs(x= "Province", y= "Percentage" )`);}


# plot the number of single parent households with children

if($trait1==2){$R->run(q`ggplot(data, aes(Province,SingleParent, fill=Year)) + geom_bar(stat="identity", position = "dodge", width=0.7,) + ggtitle("% of Households With Children at Home from Single Parent Families")+ labs(x= "Province", y= "Percentage" )`);}


# plot the number of common law parent households with children

if($trait1==3){$R->run(q`ggplot(data, aes(Province,CommonLaw, fill=Year)) + geom_bar(stat="identity", position = "dodge", width=0.7,) + ggtitle("% of Households With Children at Home from Common Law Families")+ labs(x= "Province", y= "Percentage" )`);}


# plot the number of married parent households with children

if($trait1==4){$R->run(q`ggplot(data, aes(Province,Married, fill=Year)) + geom_bar(stat="identity", position = "dodge", width=0.7,) + ggtitle("% of Households With Children at Home from Conjugal Families")+ labs(x= "Province", y= "Percentage" )`);}

if($trait1==5){
$R->run(q`ggplot(data, aes(Province,Ratio, fill=Year)) + geom_bar(stat="identity", position = "dodge", width=0.7,) + ggtitle("% of Households With Children from Non-Conjugal Families")+ labs(x= "Province", y= "Percentage" )`);
$R->run(q`ggplot(data, aes(Province,SingleParent, fill=Year)) + geom_bar(stat="identity", position = "dodge", width=0.7,) + ggtitle("% of Households With Children from Single Parent Families")+ labs(x= "Province", y= "Percentage" )`);
$R->run(q`ggplot(data, aes(Province,CommonLaw, fill=Year)) + geom_bar(stat="identity", position = "dodge", width=0.7,) + ggtitle("% of Households With Children from Common Law Families")+ labs(x= "Province", y= "Percentage" )`);
$R->run(q`ggplot(data, aes(Province,Married, fill=Year)) + geom_bar(stat="identity", position = "dodge", width=0.7,) + ggtitle("% of Households With Children from Conjugal Families")+ labs(x= "Province", y= "Percentage" )`);

}


# close down the PDF device
$R->run(q`dev.off()`);

$R->stop();

if($delete==1){my $file_to_remove = 'output.csv';

my $num_removed = unlink $file_to_remove;}



