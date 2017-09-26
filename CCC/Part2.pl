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
my $file2;
my $filename     = $EMPTY;
my @records;
my $statNum = 0;
my @year;
my @coordinate;
my @value;
my @geo;
my @crime;
my @statType;
my $csv          = Text::CSV->new({ sep_char => $COMMA });

$filename = "alldata.csv";

open my $names_fh, '<', $filename or die "Unable to open names file: $filename\n";
@records = <$names_fh>;

close $names_fh or
   die "Unable to close: $filename\n";  

foreach my $stat ( @records ) {
  
 if ( $csv->parse($stat) ) {
     
	 my @master_fields = $csv->fields();
      
      $statNum++;
      
      $year[$statNum]= $master_fields[0];
      $geo[$statNum] = $master_fields[1];
      $crime[$statNum] = $master_fields[2];
      $statType[$statNum] = $master_fields[3]; 
      $coordinate[$statNum]=$master_fields[5];
      $value[$statNum]=$master_fields[6];  
          
   }

}

#Looking at all the coordinates

#print $statNum."\n";

for my $i (1..$statNum) {

	#print $coordinate[$i]."\n";
	#print $year[$i]."\n";
	#print $value[$i]."\n";
}

#Separating the coordinates

my @val1;
my @val2;
my @val3;

for my $j (1..$statNum) {
	
	($val1[$j], $val2[$j], $val3[$j]) = split(/\./, $coordinate[$j]);
	
	#print $val1[$j]."\n".$val2[$j]."\n".$val3[$j]."\n";

}

#val1 indicates geographical location
#val2 indicates type of crime committed
#val3 indicates type of statistic used

#CHOOSING PROVINCE 1#


my $valid = 0;

print "Choose to see stats for a province or territory or Canada\n";
print "1.Canada\n2.Newfoundland & Labrador\n3.Prince Edward Island\n4.Nova Scotia\n5.New Brunswick\n6.Quebec\n7.Ontario\n8.Manitoba\n9.Saskatchewan\n10.Alberta\n11.British Columbia\n12.Yukon\n13.Northwest Territories\n14.Nunavut\n";

my $province1;

while ( $valid == 0 ) {
					
$province1 = <STDIN>;
chomp $province1;

switch($province1) {
	
	case 1	{$province1 = 1; $valid = 1;}
	case 2	{$province1 = 2; $valid = 1;}
	case 3	{$province1 = 4; $valid = 1;}
	case 4	{$province1 = 5; $valid = 1;}
	case 5	{$province1 = 7; $valid = 1;}
	case 6	{$province1 = 9; $valid = 1;}
	case 7	{$province1 = 16; $valid = 1;}
	case 8	{$province1 = 28; $valid = 1;}
	case 9	{$province1 = 30; $valid = 1;}
	case 10	{$province1 = 33; $valid = 1;}
	case 11	{$province1 = 36; $valid = 1;}
	case 12	{$province1 = 40; $valid = 1;}
	case 13	{$province1 = 41; $valid = 1;}
	case 14	{$province1 = 42; $valid = 1;}
	else	{print "Incorrect selection, try again: "; $valid = 0}
	
}
}

#CHOOSING PROVINCE 2#

$valid = 0;

print "Choose another province to compare data for\n";
print "1.Canada\n2.Newfoundland & Labrador\n3.Prince Edward Island\n4.Nova Scotia\n5.New Brunswick\n6.Quebec\n7.Ontario\n8.Manitoba\n9.Saskatchewan\n10.Alberta\n11.British Columbia\n12.Yukon\n13.Northwest Territories\n14.Nunavut\n";

my $province2;

while ($valid eq 0 ) {

$province2 = <STDIN>;
chomp $province2;

switch($province2) {
	
	case 1	{$province2 = 1; $valid = 1;}
	case 2	{$province2 = 2; $valid = 1;}
	case 3	{$province2 = 4; $valid = 1;}
	case 4	{$province2 = 5; $valid = 1;}
	case 5	{$province2 = 7; $valid = 1;}
	case 6	{$province2 = 9; $valid = 1;}
	case 7	{$province2 = 16; $valid = 1;}
	case 8	{$province2 = 28; $valid = 1;}
	case 9	{$province2 = 30; $valid = 1;}
	case 10	{$province2 = 33; $valid = 1;}
	case 11	{$province2 = 36; $valid = 1;}
	case 12	{$province2 = 40; $valid = 1;}
	case 13	{$province2 = 41; $valid = 1;}
	case 14	{$province2 = 42; $valid = 1;}
	else	{print "Incorrect selection, try again: "; $valid = 0;}
	
}

	if ($province1 eq $province2) {
		
		print "Incorrect selection, try again: ";
		$valid = 0;
		
	}
	
}


#CHOOSING ADULT OR YOUTH FOR A CERTAIN PROVINCE#

print "Please select which data you'd like to look at\n";

print "1. Adult or 2. Youth\n";

$valid = 0;

my $AgeIn;

while ($valid eq 0 ) {
	
$AgeIn = <STDIN>;
chomp $AgeIn;

switch ($AgeIn) {
	
	case 1 {$AgeIn = 10; $valid = 1;}
	case 2 {$AgeIn = 12; $valid = 1;}
	else {print "Incorrect selection, try again: "; $valid = 0;}
}

	
}

#CHOOSING A YEAR#

print "Choose a year between 1998-2015 to see stats for\n";
my $yearIn;

$valid = 0;

while ($valid eq 0){

$yearIn = <STDIN>;
chomp $yearIn;

if ($yearIn eq 1998 || $yearIn eq 1999 || $yearIn eq 2000 || $yearIn eq 2001 || $yearIn eq 2002 || $yearIn eq 2003 || $yearIn eq 2004 || $yearIn eq 2005 || $yearIn eq 2006 || $yearIn eq 2007 || $yearIn eq 2008 || $yearIn eq 2009 || $yearIn eq 2010 || $yearIn eq 2011 || $yearIn eq 2012 || $yearIn eq 2013 || $yearIn eq 2014 || $yearIn eq 2015 ){

	$valid = 1;

}

else {

	print "Invalid selection, try again: ";
	$valid = 0;
}
}



#CHOOSING CRIME#

$valid = 0;
my $crimeIn;

print "Choose a crime to see stats for\n";
print 
"
1. All violations 
2. Homicides
3. Sexual Assault
4. Assault
5. Robbery
6. Property Crime
7. Theft
8. Fraud
9. Impaired Driving
10. Drug Violations
";

while ($valid eq 0) {
	
$crimeIn = <STDIN>;
chomp $crimeIn;

switch ($crimeIn) {
	
	case 1	{$crimeIn = 1; $valid = 1;}
	case 2	{$crimeIn = 5; $valid = 1;}
	case 3	{$crimeIn = 16; $valid = 1;}
	case 4	{$crimeIn = 22; $valid = 1;}
	case 5	{$crimeIn = 35; $valid = 1;}
	case 6	{$crimeIn = 64; $valid = 1;}
	case 7	{$crimeIn = 73; $valid = 1;}
	case 8	{$crimeIn = 80; $valid = 1;}
	case 9	{$crimeIn = 149; $valid = 1;}
	case 10 {$crimeIn = 231; $valid = 1;}
	else {print "Incorrect selection, try again: "; $valid = 0;}
}

}


#ITERATE, SORT AND PRINT#

{

open my $fh, '>', 'datacollect.csv';
printf {$fh} "Province".","."Rate\n";

for my $v (1..$statNum) {
	
	if  
	( 
	( ($val1[$v] eq $province1) or ($val1[$v] eq $province2) )
	and 
	($year[$v] eq $yearIn) 
	and 
	($val2[$v] eq $crimeIn)
	and
	($val3[$v] eq $AgeIn)
	) 
	
	{
		
		print $statType[$v]." in ".$geo[$v]." for ".$crime[$v]." is ".$value[$v]."\n";
		
		print {$fh} $geo[$v].",".$value[$v]."\n";
	}
		
	
}

	close $fh;


my $R = Statistics::R->new();
$file2 = "data.pdf";

$R->run(qq'pdf("$file2", paper="letter")');


$R->run(q'library(ggplot2)');
$R->run(qq'data<-read.csv("datacollect.csv")');

$R->run(q'ggplot(data, aes(x=Province, y=Rate)) + geom_bar(stat = "identity", width=0.5, color="blue", fill=rgb(0.1,0.4,0.5,0.7)) + ggtitle("Rate, Charged per 100,000 in selected locations") + labs(x="Province", y="Rate, Charge per 100,000 population")');

$R->run(q'dev.off()');
$R->stop();



}





