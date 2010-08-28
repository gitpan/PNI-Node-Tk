package PNI::Node::Tk;

our $VERSION = '0.04';

use Tk;

sub init {
    my $node = shift;

    $node->add_output( 'tk_version' => $Tk::VERSION );
}

sub task { }

1;
