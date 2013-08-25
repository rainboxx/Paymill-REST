package Paymill::REST::Operations::Find;

use Moose::Role;

sub find {
    my ($self, $identifier) = @_;

    my $uri = $self->base_url . $self->type . 's/' . $identifier;
    my $item_attrs = $self->_get_response({ uri => $uri });

    return $self->_build_item($item_attrs);
}

no Moose::Role;
1;
