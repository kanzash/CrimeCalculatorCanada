
use strict;
use Switch;
use warnings;
use version;   our $VERSION = qv('5.16.0');   # This is the version of Perl to be used
use Text::CSV  1.32;   # We will be using the CSV module (version 1.32 or higher)
                       # to parse each line


my $EMPTY = q{};
my $SPACE = q{ };
my $COMMA = q{,};

#Have all files parsed and loaded into the arrays as soon as program begins
#Open file, load into respective arrays, Close file

my $command;


print "Welcome to Crime Calculator Canada, would you like to...\n";

my $quit = 0;

my $userOp;

while ( $quit == 0 ) {

print
"1. Compare crime data across provinces
2. Compare youth crime rates across the country
3. Compare familial structures across Canada
4. Compare distribution of native and non-native languages across Canada
5. Quit\n";

$userOp = <STDIN>;
chomp $userOp;

	if ($userOp eq 1 ) {
		
		$command = system('perl Part1.pl');
		
	}
	
	elsif ($userOp eq 2) {
		
		$command = system('perl Part2.pl');
		
	}
	
	elsif ($userOp eq 3) {
		
		$command = system('perl Part3.pl');
		
	}
	
	elsif ($userOp eq 4) {
		
		$command = system('perl Part4.pl');
		
	}
	
	elsif ($userOp eq 5) {
		
		$quit = 1;
		
	}
	
	else {
		
		print "Invalid selection, please try again\n";
		
	}

}



