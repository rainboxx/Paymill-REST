package Paymill::REST::Transactions;

use Moose;
with 'Paymill::REST::Base';

has '+type' => (default => 'transaction');

__PACKAGE__->meta->make_immutable;
1;