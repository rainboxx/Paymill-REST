package Paymill::REST::Item::Refund;

use Moose;
use MooseX::Types::DateTime::ButMaintained qw(DateTime);

has _factory => (is => 'ro', isa => 'Object');

has id          => (is => 'ro', isa => 'Str');
has amount      => (is => 'ro', isa => 'Int', required => 1);
has status      => (is => 'ro', isa => 'RefundStatus');
has description => (is => 'ro', isa => 'Undef|Str');
has livemode    => (is => 'ro', isa => 'Bool');
has created_at  => (is => 'ro', isa => DateTime, coerce => 1);
has updated_at  => (is => 'ro', isa => DateTime, coerce => 1);

has transaction => (
    is      => 'ro',
    isa     => 'Undef|Object|HashRef',
    trigger => sub { Paymill::REST::TypesAndTriggers::item_from_hashref('transaction', @_) }
);

no Moose;
1;
