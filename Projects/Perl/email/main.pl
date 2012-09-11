#!/usr/bin/perl -w

use strict;
use app_config;
use email_sender;
use db_engine;

our $emailSender;
our $dbEngine;
our $config;

sub main {
	$config = new AppConfig("config.ini");
	$dbEngine = new DBEngine($config);
	my $query = $config->get_value("sql", "query");
	my @records = $dbEngine->execute($query);
	$emailSender = EmailSender->new($config);
	&send_mail(@records);
}


sub send_mail {
	# @records is a list what will be sent out.
	my (@records) = @_;
	# get sender
    my $from = $config->get_value("smtp", "from");
	# get update sql scripts.
	my $sql_update= $config->get_value("sql", "update");
	# send mail and update db.
	foreach my $record (@records) {
		my $id = $record->{"id"};
		my $receiver = $record->{"receiver"};
		my $subject = $record->{"title"};
		my $body = $record->{"content"};
		$emailSender->send($from, $receiver, $subject, $body);
		my $sql = sprintf($sql_update, 1, $id);
		$dbEngine->execute($sql);
	}
	$dbEngine->close();
	$emailSender->close();
}

&main();
