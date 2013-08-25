package Paymill::REST::Operations::Delete;

use Moose::Role;

sub delete {
    my ($self, $identifier) = @_;

    if (!$identifier && $self->can('id')) {
        $identifier = $self->id;
    }

    my $factory = $self;
    if ($self->can('_factory')) {
        $factory = $self->_factory;
    }

    my $uri = $factory->base_url . $factory->type . 's/' . $identifier;
    my $item_attrs = $factory->_get_response({ uri => $uri, method => 'DELETE' });

    return $factory->_build_item($item_attrs);
}

no Moose::Role;
1;
