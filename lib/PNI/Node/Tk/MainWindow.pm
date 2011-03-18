package PNI::Node::Tk::MainWindow;
use strict;
use warnings;
our $VERSION = '0.11';
use base 'PNI::Node';
use Tk;

sub init {
    my $node = shift;
    $node->add_input( 'responsiveness', data => 10 );
    $node->add_output( 'main_window', data => new MainWindow );

    return 1;
}

sub task {
    my $node = shift;

    &DoOneEvent for ( 0 .. $node->get_input('responsiveness')->get_data );

    return 1;
}

1;
__END__

=head1 NAME

PNI::Node::Tk::MainWindow

=head1 DESCRIPTION

Every Tk program must have at least one MainWindow. 
That's why this node also handles Tk events so there is no need to call the Tk MainLoop.
Thanks to Nick Ing-Simmons in Perl/Tk can co-exist multiple MainWindows, so
it is possible to create more than one Tk::MainWindow PNI node,
but normally just one should be enough.

=cut

