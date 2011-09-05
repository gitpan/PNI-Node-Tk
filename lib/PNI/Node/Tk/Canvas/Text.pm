package PNI::Node::Tk::Canvas::Text;
use strict;
use parent 'PNI::Node';

sub init {
    my $node = shift;

    my $canvas = $node->add_input('canvas');

    my $y = $node->add_input('y');

    my $x = $node->add_input('x');

    my $text = $node->add_input('text');

    my $tk_id = $node->add_output('tk_id');

    return 1;
}

sub task {
    my $node = shift;

    return 1 if $node->has_no_input_slot_changed;

    my $canvas = $node->get_input('canvas');
    $canvas->is_defined or return 1;
    my $tk_canvas = $canvas->get_data;

    my $y = $node->get_input('y');

    my $x = $node->get_input('x');

    my $text = $node->get_input('text');

    my $tk_id = $node->get_output('tk_id');

    # Initialize Text item.
    if (    $tk_id->is_undef
        and $y->is_defined
        and $x->is_defined
        and $text->is_defined )
    {

        my $tk_canvas_text_id =
          $tk_canvas->createText( $x->data, $y->data, -text => $text->data )
          or return PNI::Error::generic;

        $tk_id->set_data($tk_canvas_text_id);
    }

    # Nothing to do if Text is not initialized.
    $tk_id->is_defined or return 1;
    my $id = $tk_id->get_data;

    if ( $text->is_changed and $text->is_scalar ) {
        $tk_canvas->itemconfigure( $id, -text => $text->get_data );
    }

    if ( $y->is_changed ) {

    }

    if ( $x->is_changed ) {

    }

    return 1;
}

1
__END__

=head1 NAME

PNI::Node::Tk::Canvas::Text - Text Tk::Canvas item

=head1 INPUTS

=over 4

=item canvas

=item y

=item x

=item text

=back

=head1 OUTPUTS

=over 4

=item tk_id

=back

=cut

