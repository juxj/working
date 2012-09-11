#!/usr/bin/perl -w
#parse ini file using Config::IniFiles;
package AppConfig;
use Cwd;
use Config::IniFiles;

our %ini;

sub new {
	my $class = shift();
	my $self={};
	my $file_name = shift();
	# get real path.
	my $dir = getcwd; 
	my $file = $dir."/".$file_name;
	# initialize configuration values
	tie %ini, 'Config::IniFiles', ( -file => $file);
	#bless values;
	bless $self, $class;
	return $self;
}

sub get_value {
	my ($self, $section, $key) = @_;
	my $value = $ini{$section}{$key};
	return $value;
}

1;
