package Paymill::REST::Subscriptions;

use Moose;
with 'Paymill::REST::Base';
with 'Paymill::REST::Operations::Delete';

has '+type' => (default => 'subscription');

__PACKAGE__->meta->make_immutable;
1;