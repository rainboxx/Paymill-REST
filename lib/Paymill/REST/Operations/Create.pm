package Paymill::REST::Operations::Create;

use Moose::Role;

sub create {
    my ($self, $data) = @_;

    my $factory = $self;
    if ($self->can('_factory')) {
        $factory = $self->_factory;
    }

    my $uri = $factory->base_url . $factory->type . 's';

    if ($data->{id}) {
        $uri .= '/' . delete $data->{id};
    }

    my $item_attrs = $factory->_get_response({ uri => $uri, query => $data, method => 'POST' });

    if ($self->can('_type_create')) {
        $item_attrs->{_type} = $self->_type_create;
    }

    return $factory->_build_item($item_attrs);
}

no Moose::Role;
1;
