package Paymill::REST::Operations::List;

use Moose::Role;

sub list {
    my ($self, $filter_and_sort) = @_;

    my $uri = $self->base_url . $self->type . 's';
    my $item_attrs = $self->_get_response({ uri => $uri, query => $filter_and_sort });

    return $self->_build_items($item_attrs);
}

no Moose::Role;
1;
