# NAME

Paymill::REST - A wrapper around PAYMILL's payment API

# SYNOPSIS

    use Paymill::REST;
    my $trx_api             = Paymill::REST::Transactions->new;
    my $created_transaction = $trx_api->create(
        {
            amount      => 4200,
            token       => '098f6bcd4621d373cade4e832627b4f6',
            currency    => 'USD',
            description => "Hitchhiker's Guide to the Galaxy",
        }
    );

# DESCRIPTION

Paymill::REST is a wrapper around PAYMILL's payment API.

# GENERAL ARCHITECTURE

It is intended that things such creating and retrieving items is done through
operations called on the respective `Paymill::REST::*` modules (a so called __item factory__), so
everything related to transactions is achieved
through [Paymill::REST::Transactions](http://search.cpan.org/perldoc?Paymill::REST::Transactions).

Each operation of those factories is returning one or a list of the
appropriate item modules, so operations called on [Paymill::REST::Transactions](http://search.cpan.org/perldoc?Paymill::REST::Transactions)
are returning one or a list of [Paymill::REST::Item::Transaction](http://search.cpan.org/perldoc?Paymill::REST::Item::Transaction).

## AVAILABLE OPERATIONS

Not all operations are available to every item factory (currently only
`delete` is not available to [Paymill::REST::Item::Refund](http://search.cpan.org/perldoc?Paymill::REST::Item::Refund)).

- Creating new items

    [Paymill::REST::Operations::Create](http://search.cpan.org/perldoc?Paymill::REST::Operations::Create)

- Delete existing items

    [Paymill::REST::Operations::Delete](http://search.cpan.org/perldoc?Paymill::REST::Operations::Delete)

- Find a single item

    [Paymill::REST::Operations::Find](http://search.cpan.org/perldoc?Paymill::REST::Operations::Find)

- List all or a subset of items

    [Paymill::REST::Operations::List](http://search.cpan.org/perldoc?Paymill::REST::Operations::List)

# CONFIGURATION

Each item factory inherits from [Paymill::REST::Base](http://search.cpan.org/perldoc?Paymill::REST::Base), which is
holding all the configuration.  The following options are available:

- api\_key

    Defines your private API key which you get from PAYMILL.

- proxy

    An [URI](http://search.cpan.org/perldoc?URI) or URI string which is passed to [LWP::UserAgent](http://search.cpan.org/perldoc?LWP::UserAgent)'s `proxy`
    method for connecting to the PAYMILL API.

__Note:__ every other option you'll find in the code is only meant for
development of this module and shouldn't be changed!

# AUTHOR

Matthias Dietrich <perl@rainboxx.de>

# COPYRIGHT

Copyright 2013 - Matthias Dietrich

# LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# SEE ALSO

- PAYMILL:

    [http://www.paymill.com](http://www.paymill.com)

- Item factories:

    [Paymill::REST::Clients](http://search.cpan.org/perldoc?Paymill::REST::Clients), [Paymill::REST::Offers](http://search.cpan.org/perldoc?Paymill::REST::Offers), [Paymill::REST::Payments](http://search.cpan.org/perldoc?Paymill::REST::Payments),
    [Paymill::REST::Preauthorizations](http://search.cpan.org/perldoc?Paymill::REST::Preauthorizations), [Paymill::REST::Refunds](http://search.cpan.org/perldoc?Paymill::REST::Refunds),
    [Paymill::REST::Subscriptions](http://search.cpan.org/perldoc?Paymill::REST::Subscriptions), [Paymill::REST::Transactions](http://search.cpan.org/perldoc?Paymill::REST::Transactions),
    [Paymill::REST::Webhooks](http://search.cpan.org/perldoc?Paymill::REST::Webhooks)

- Item modules:

    [Paymill::REST::Item::Client](http://search.cpan.org/perldoc?Paymill::REST::Item::Client), [Paymill::REST::Item::Offer](http://search.cpan.org/perldoc?Paymill::REST::Item::Offer), [Paymill::REST::Item::Payment](http://search.cpan.org/perldoc?Paymill::REST::Item::Payment),
    [Paymill::REST::Item::Preauthorization](http://search.cpan.org/perldoc?Paymill::REST::Item::Preauthorization), [Paymill::REST::Item::Refund](http://search.cpan.org/perldoc?Paymill::REST::Item::Refund),
    [Paymill::REST::Item::Subscription](http://search.cpan.org/perldoc?Paymill::REST::Item::Subscription), [Paymill::REST::Item::Transaction](http://search.cpan.org/perldoc?Paymill::REST::Item::Transaction),
    [Paymill::REST::Item::Webhook](http://search.cpan.org/perldoc?Paymill::REST::Item::Webhook)

# TODO

- Add ability to save changes to item objects
- Add convenience operations (eg. `refund` for transactions) where possible
