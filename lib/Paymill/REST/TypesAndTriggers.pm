package Paymill::REST::TypesAndTriggers;

use Moose;
use Moose::Util::TypeConstraints;

enum 'CCorDebit',     [qw/creditcard debit/];
enum 'TxStatus',      [qw/open pending closed failed partial_refunded refunded preauth chargeback/];
enum 'RefundStatus',  [qw/open refunded failed/];
enum 'PreauthStatus', [qw/open pending closed failed deleted preauth/];

sub item_from_hashref {
    my ($type, $self, $new_value, $old_value) = @_;

    unless (blessed $new_value || ref $new_value ne 'HASH') {
        my $item_class = 'Paymill::REST::Item::' . ucfirst($type);

        (ref $self)->meta->get_attribute($type)
            ->set_raw_value($self, $item_class->new(%$new_value, _factory => $self->_factory));
    }
}

sub items_from_arrayref {
    my ($type, $self, $new_value, $old_value) = @_;

    (my $singular_type = $type) =~ s/s$//;

    unless (blessed $new_value->[0] || ref $new_value->[0] ne 'HASH') {
        my $item_class = 'Paymill::REST::Item::' . ucfirst($singular_type);

        my $raw_value = [];
        foreach (@$new_value) {
            push @$raw_value, $item_class->new(%{ $new_value->[0] }, _factory => $self->_factory);
        }

        (ref $self)->meta->get_attribute($type)->set_raw_value($self, $raw_value);
    }
}

no Moose::Util::TypeConstraints;
1;
