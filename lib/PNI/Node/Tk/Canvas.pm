package PNI::Node::Tk::Canvas;
use strict;
use warnings;
use base 'PNI::Node';

my $default_configure_opts = { -height => 200, -width => 300 } ;

sub init {
    my $node = shift;

    my $parent = $node->add_input('parent');

    my $configure_opts = $node->add_input('configure_opts');

    my $pack_opts = $node->add_input('pack_opts');

    my $canvas = $node->add_output('canvas');

    $configure_opts->set_data( $default_configure_opts );

    return 1;
}

sub task {
    my $node = shift;

    my $parent = $node->get_input('parent');

    my $configure_opts = $node->get_input('configure_opts');

    my $pack_opts = $node->get_input('pack_opts');

    my $canvas = $node->get_output('canvas');

    #TODO needs a lot of fixing, this is a very important node
    #     since it let the user draw stuff

    return 1 if $parent->is_undef;

    if ( $canvas->is_undef ) { }
    else {

        #my $tk_main_window = $parent->get_output('main_window')->get_data;
        my $tk_main_window = $parent->data;

        my $tk_canvas = $tk_main_window->Canvas;
        $canvas->set_data($tk_canvas);

        $tk_canvas->configure( %{ $configure_opts->get_data } );

        $tk_canvas->pack( %{ $pack_opts->get_data } );
        print $tk_canvas;
    }

    return 1;
}

1;

=head1 NAME

PNI::Node::Tk::Canvas - renders stuff with Tk::Canvas

=head1 INPUTS

=over 4

=item parent

=item configure_opts

=item pack_opts

=back

=head1 OUTPUTS

=over 4

=item canvas

=back

=cut

