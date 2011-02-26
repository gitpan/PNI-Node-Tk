package PNI::Node::Tk::Canvas;
use strict;
use warnings;
our $VERSION = '0.1';
use base 'PNI::Node';

sub init {
    my $node = shift;
    $node->add_input('parent');
    $node->add_input('configure_opts');
    $node->add_input('pack_opts');

    $node->add_output('canvas');
    return 1;
}

sub task {
    my $node = shift;

    return unless $node->get_input('parent')->get_data;

    if ( $node->get_output('canvas')->get_data ) { }
    else {

        # input parent is a PNI::NOde::Tk::MainWindow
        $node->get_output('canvas')
          ->set_data(
            $node->get_input('parent')->get_data->get_output('main_window')
              ->get_data->Canvas() );
    }

   #    if ( $node->get_input('window')
   #        and not defined $node->get_output('canvas') )
   #    {
   #        $node->set_output( canvas => $node->get_input('window')->Canvas() );
   #
   #    $node->get_output('canvas')
   #      ->configure( %{ $node->get_input('configure') } );
   #    $node->get_output('canvas')
   #      ->pack( %{ $node->get_input('pack_options') } );
   #}

    return 1;
}

1;
