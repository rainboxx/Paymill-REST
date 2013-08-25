package Paymill::REST::Preauthorizations;

use Moose;
with 'Paymill::REST::Base';
with 'Paymill::REST::Operations::Delete';

has '+type' => (default => 'preauthorization');
has _type_create => (is => 'ro', isa => 'Str', default => 'transaction');

__PACKAGE__->meta->make_immutable;
1;
