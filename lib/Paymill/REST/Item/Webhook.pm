package Paymill::REST::Item::Webhook;

use Moose;
use MooseX::Types::DateTime::ButMaintained qw(DateTime);
use MooseX::Types::URI qw(Uri);
use MooseX::Types::Email qw(EmailAddress);

with 'Paymill::REST::Operations::Delete';

has _factory => (is => 'ro', isa => 'Object');

has id          => (is => 'ro', isa => 'Str');
has url         => (is => 'ro', isa => Uri, coerce => 1);
has email       => (is => 'ro', isa => EmailAddress);
has livemode    => (is => 'ro', isa => 'Bool');
has event_types => (is => 'ro', isa => 'ArrayRef[Str]');

no Moose;
1;
