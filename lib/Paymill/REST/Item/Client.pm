package Paymill::REST::Item::Client;

use Moose;
use MooseX::Types::DateTime::ButMaintained qw(DateTime);

with 'Paymill::REST::Operations::Delete';

has _factory => (is => 'ro', isa => 'Object');

has id          => (is => 'ro', isa => 'Str');
has description => (is => 'ro', isa => 'Undef|Str');
has email       => (is => 'ro', isa => 'Undef|Str');
has created_at  => (is => 'ro', isa => DateTime, coerce => 1);
has updated_at  => (is => 'ro', isa => DateTime, coerce => 1);

has subscription => (
    is      => 'ro',
    isa     => 'Undef|Object|ArrayRef',
    trigger => sub { Paymill::REST::TypesAndTriggers::items_from_arrayref('subscription', @_) }
);
has payment => (
    is      => 'ro',
    isa     => 'Undef|Object|ArrayRef',
    trigger => sub { Paymill::REST::TypesAndTriggers::items_from_arrayref('payment', @_) }
);

no Moose;
1;
