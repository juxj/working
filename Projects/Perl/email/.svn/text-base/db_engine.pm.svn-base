#!/usr/bin/perl -w
#parse ini file using Config::IniFiles;
package DBEngine;

use strict;
use warnings;
use DBI;
#public variables here.
our $config;
our $dbh;

sub new {
	my $class = shift();
	my $self={};
	$config = shift();
	&set_dbh($config);
	bless $self, $class;
	return $self;
}

sub execute {
	my ($self, $sql) = @_;
	my $sth = $dbh->prepare($sql);
	$sth->execute();

	# if the sql is a seletct statement,  
	# then try to retrive records from db.	
	# else return null.
	my $position = index($sql, "select");
	my @records=();
	if ($position > -1) {
		my $i = 0;
		while(my $record = $sth->fetchrow_hashref()) {
			push(@records, $record);
			$i = $i + 1;
		}
	}
	return @records;
}

sub set_dbh {
	my $node = "mysql";
	my $host = $config->get_value($node, "host");
	my $user = $config->get_value($node, "user");
	my $password = $config->get_value($node, "password");
	my $database = $config->get_value($node, "database");
	$dbh = DBI->connect("DBI:mysql:$database;host=$host", "$user", "$password")
		|| die "Couldn't connect to database server: $DBI::errstr";  
	$dbh->do("SET NAMES 'utf8'");
}

sub close {
	my ($self) = @_;
	$dbh->disconnect();
}

1;
