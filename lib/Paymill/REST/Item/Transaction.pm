package Paymill::REST::Item::Transaction;

use Moose;
use MooseX::Types::DateTime::ButMaintained qw(DateTime);

has _factory => (is => 'ro', isa => 'Object');

has id            => (is => 'ro', isa => 'Str');
has description   => (is => 'ro', isa => 'Str');
has amount        => (is => 'ro', isa => 'Int', required => 1);
has origin_amount => (is => 'ro', isa => 'Int');
has currency      => (is => 'ro', isa => 'Str', required => 1);
has livemode      => (is => 'ro', isa => 'Bool');
has created_at    => (is => 'ro', isa => DateTime, coerce => 1);
has updated_at    => (is => 'ro', isa => DateTime, coerce => 1);
has response_code => (is => 'ro', isa => 'Int');
has status        => (is => 'ro', isa => 'TxStatus');

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
has preauthorization => (
    is      => 'ro',
    isa     => 'Undef|Object|HashRef',
    trigger => sub { Paymill::REST::TypesAndTriggers::item_from_hashref('preauthorization', @_) }
);
has refunds => (
    is      => 'ro',
    isa     => 'Undef|Object|ArrayRef',
    trigger => sub { Paymill::REST::TypesAndTriggers::items_from_arrayref('refunds', @_) }
);

# Undocumented!
has invoices => (is => 'ro', isa => 'ArrayRef');

no Moose;
1;
