package Paymill::REST::Payments;

use Moose;
with 'Paymill::REST::Base';
with 'Paymill::REST::Operations::Delete';

has '+type' => (default => 'payment');

__PACKAGE__->meta->make_immutable;
1;