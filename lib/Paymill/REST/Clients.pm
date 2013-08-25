package Paymill::REST::Clients;

use Moose;
with 'Paymill::REST::Base';
with 'Paymill::REST::Operations::Delete';

has '+type' => (default => 'client');

__PACKAGE__->meta->make_immutable;
1;