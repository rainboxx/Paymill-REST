package Paymill::REST::Webhooks;

use Moose;
with 'Paymill::REST::Base';
with 'Paymill::REST::Operations::Delete';

has '+type' => (default => 'webhook');

__PACKAGE__->meta->make_immutable;
1;