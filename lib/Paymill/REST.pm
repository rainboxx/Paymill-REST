package Paymill::REST;

use strict;
use 5.008_005;
our $VERSION = '0.01';

my $PRIVATE_KEY = '';

use Module::Find;

BEGIN {
    useall Paymill::REST;
}

1;
__END__

=encoding utf-8

=head1 NAME

Paymill::REST - A wrapper around PAYMILL's payment API

=head1 SYNOPSIS

  use Paymill::REST;
  my $trx_api             = Paymill::REST::Transactions->new;
  my $created_transaction = $trx_api->create(
      {
          amount      => 4200,
          token       => '098f6bcd4621d373cade4e832627b4f6',
          currency    => 'USD',
          description => "Hitchhiker's Guide to the Galaxy",
      }
  );

=head1 DESCRIPTION

Paymill::REST is a wrapper around PAYMILL's payment API.

Docs are still missing.

=head1 AUTHOR

Matthias Dietrich E<lt>perl@rainboxx.deE<gt>

=head1 COPYRIGHT

Copyright 2013 - Matthias Dietrich

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

=cut
