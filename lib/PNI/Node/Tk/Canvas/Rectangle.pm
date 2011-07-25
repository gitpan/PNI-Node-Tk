package PNI::Node::Tk::Canvas::Rectangle;
use strict;
use warnings;
use base 'PNI::Node';

sub init {
    my $node = shift;

    my $canvas = $node->add_input('canvas');

    my $y1 = $node->add_input('y1');

    my $y2 = $node->add_input('y2');

    my $x1 = $node->add_input('x1');

    my $x2 = $node->add_input('x2');

    my $tk_id = $node->add_output('tk_id');

    return 1;
}

sub task {
    my $node = shift;

    my $canvas = $node->get_input('canvas');

    my $y1 = $node->get_input('y1');

    my $y2 = $node->get_input('y2');

    my $x1 = $node->get_input('x1');

    my $x2 = $node->get_input('x2');

    return 1;
}

1;

=head1 NAME

PNI::Node::Tk::Canvas::Rectangle - Rectangle Tk::Canvas item

=head1 INPUTS

=over 4

=item canvas

=item y1

=item y2

=item x1

=item x2

=back

=head1 OUTPUTS

=over 4

=item tk_id

=back

=cut

