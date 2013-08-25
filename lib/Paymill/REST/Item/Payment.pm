package Paymill::REST::Item::Payment;

use Moose;
use MooseX::Types::DateTime::ButMaintained qw(DateTime);

with 'Paymill::REST::Operations::Delete';

has _factory => (is => 'ro', isa => 'Object');

has id           => (is => 'ro', isa => 'Str');
has type         => (is => 'ro', isa => 'CCorDebit');
has client       => (is => 'ro', isa => 'Str');
has expire_month => (is => 'ro', isa => 'Int');
has expire_year  => (is => 'ro', isa => 'Int');
has last4        => (is => 'ro', isa => 'Int');
has card_type    => (is => 'ro', isa => 'Str');
has card_holder  => (is => 'ro', isa => 'Undef|Str');
has country      => (is => 'ro', isa => 'Undef|Str');
has code         => (is => 'ro', isa => 'Str');
has account      => (is => 'ro', isa => 'Str');
has holder       => (is => 'ro', isa => 'Str');

has created_at => (is => 'ro', isa => DateTime, coerce => 1);
has updated_at => (is => 'ro', isa => DateTime, coerce => 1);

no Moose;
1;
