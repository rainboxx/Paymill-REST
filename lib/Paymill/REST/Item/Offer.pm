package Paymill::REST::Item::Offer;

use Moose;
use MooseX::Types::DateTime::ButMaintained qw(DateTime);

with 'Paymill::REST::Operations::Delete';

has _factory => (is => 'ro', isa => 'Object');

has id                 => (is => 'ro', isa => 'Str');
has name               => (is => 'ro', isa => 'Str', required => 1);
has amount             => (is => 'ro', isa => 'Int', required => 1);
has currency           => (is => 'ro', isa => 'Str', required => 1);
has interval           => (is => 'ro', isa => 'Str', required => 1);
has trial_period_days  => (is => 'ro', isa => 'Int|Undef');
has created_at         => (is => 'ro', isa => DateTime, coerce => 1);
has updated_at         => (is => 'ro', isa => DateTime, coerce => 1);
has subscription_count => (is => 'ro', isa => 'HashRef');

has client => (
    is      => 'ro',
    isa     => 'Undef|Object|HashRef',
    trigger => sub { Paymill::REST::TypesAndTriggers::item_from_hashref('client', @_) }
);
has payment => (
    is      => 'ro',
    isa     => 'Undef|Object|HashRef',
    trigger => sub { Paymill::REST::TypesAndTriggers::item_from_hashref('payment', @_) }
);

no Moose;
1;
