#!/usr/bin/perl -w
#   parse ini file using Config::IniFiles;
use strict;
use Cwd;
use Config::IniFiles;
my $dir = getcwd; 
my $file = $dir."/".$ARGV[0];
my %ini;
my $Section = 'mysql';
my $Parameter = 'host';
tie %ini, 'Config::IniFiles', ( -file => $file);
print "We have $ini{$Section}{$Parameter}." if $ini{$Section}{$Parameter};
$ini{$Section}{$Parameter}.='bruce';
tied (%ini)->WriteConfig("$file") ||
die "Could not write settings to new file.";

sub PrintSection()
{
	my $Section = shift;
	my ($Key,$Value);
	while ( ($Key,$Value) =each %$Section)
	{
		print $Key," = ",$Value;
		print "/n";
	}
	$Section->{'user'} = "bruce";
}
