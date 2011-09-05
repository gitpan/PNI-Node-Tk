package PNI::Node::Tk::Canvas;
use parent 'PNI::Node';
use strict;

sub init {
    my $node = shift;

    my $parent = $node->add_input('parent');

    my $configure_opts = $node->add_input(
        'configure_opts' => {
            -height => 200,
            -width  => 300,
        }
    );

    my $pack_opts = $node->add_input('pack_opts');

    my $canvas = $node->add_output('canvas');

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

    if ( $canvas->is_undef ) {

        my $tk_main_window = $parent->get_data;

        my $tk_canvas = $tk_main_window->Canvas;
        $canvas->set_data($tk_canvas);

        #$tk_canvas->configure( $configure_opts->get_data );
        $tk_canvas->configure( 
            -confine => 0,
            -height => 400, 
            -width => 600,
            -scrollregion => [0,0,1000,1000],
            -background => 'white' 
        );

        #$tk_canvas->pack( %{ $pack_opts->get_data } );
        $tk_canvas->pack( -expand => 1 , -fill => 'both' );
    }

    return 1;
}

1;
__END__

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

