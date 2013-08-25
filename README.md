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

Docs are still missing.

# AUTHOR

Matthias Dietrich <perl@rainboxx.de>

# COPYRIGHT

Copyright 2013 - Matthias Dietrich

# LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# SEE ALSO
