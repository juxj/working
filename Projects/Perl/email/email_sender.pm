#!/usr/bin/perl
package EmailSender; 

use MIME::Entity;
use Net::SMTP;
 
our $smtp;

sub new {
    # return a new instance to main process.
    my $class = shift;
    my $self = {};
    # initialize app configuration.
    my $config = shift;
    # my variables;
	# smtp 
    my $host = $config->get_value("smtp", "host");
    my $port = $config->get_value("smtp", "port");
    my $timeout = $config->get_value("smtp", "timeout"); 
	# sender's name
	# username && password
    my $user = $config->get_value("smtp", "user");
    my $password = $config->get_value("smtp", "password");
    # connect to smtp server
    $smtp = Net::SMTP->new($host,
                        Port=> $port,
                        Timeout => $timeout,
                        Hello => "163.com");
    # Authenticate
    $smtp->auth($user, $password);
    # retun.
    bless $self, $class;
    return $self;
}

sub send {
    # get all parameters which used for send mail.
    my ($self, $from, $receiver, $subject , $body) = @_;

    my $mime = MIME::Entity->build(Type  => 'multipart/alternative',
                            Encoding => '-SUGGEST',
                            From => $from,
                            To => $receiver,
                            Subject => $subject
                            );
    $mime->attach(Type => 'text/html',
                Encoding =>'-SUGGEST',
                Data => $body);
     
    # Login credentials
     
    # Open a connection to the mail.zj198.com mail server
    $smtp->mail($from);
    $smtp->to($receiver);
    $smtp->data($mime->stringify);
}

sub close {
	my ($self) = @_;
    $smtp->quit();
}

1;
