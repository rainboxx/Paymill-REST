package Paymill::REST::Offers;

use Moose;
with 'Paymill::REST::Base';
with 'Paymill::REST::Operations::Delete';

has '+type' => (default => 'offer');

__PACKAGE__->meta->make_immutable;
1;