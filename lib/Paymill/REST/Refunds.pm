package Paymill::REST::Refunds;

use Moose;
with 'Paymill::REST::Base';

has '+type' => (default => 'refund');

__PACKAGE__->meta->make_immutable;
1;