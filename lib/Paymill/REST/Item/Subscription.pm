package Paymill::REST::Item::Subscription;

use Moose;
use MooseX::Types::DateTime::ButMaintained qw(DateTime);

with 'Paymill::REST::Operations::Delete';

has _factory => (is => 'ro', isa => 'Object');

has id                   => (is => 'ro', isa => 'Str');
has livemode             => (is => 'ro', isa => 'Bool');
has created_at           => (is => 'ro', isa => DateTime, coerce => 1);
has updated_at           => (is => 'ro', isa => DateTime, coerce => 1);
has canceled_at          => (is => 'ro', isa => 'Undef|DateTime', coerce => 1);
has trial_start          => (is => 'ro', isa => 'Undef|DateTime', coerce => 1);
has trial_end            => (is => 'ro', isa => 'Undef|DateTime', coerce => 1);
has next_capture_at      => (is => 'ro', isa => 'DateTime|Bool', coerce => 1);
has cancel_at_period_end => (is => 'ro', isa => 'Bool');

has client => (
    is      => 'ro',
    isa     => 'Undef|Str|Object|HashRef',
    trigger => sub { Paymill::REST::TypesAndTriggers::item_from_hashref('client', @_) }
);
has payment => (
    is      => 'ro',
    isa     => 'Undef|Object|HashRef',
    trigger => sub { Paymill::REST::TypesAndTriggers::item_from_hashref('payment', @_) }
);
has offer => (
    is      => 'ro',
    isa     => 'Undef|Object|HashRef|ArrayRef',
    trigger => sub { Paymill::REST::TypesAndTriggers::item_from_hashref('offer', @_) }
);

no Moose;
1;
