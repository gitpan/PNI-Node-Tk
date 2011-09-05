package PNI::Node::Tk::MainWindow;
use strict;
use warnings;
use base 'PNI::Node';
use Tk;

sub init {
    my $node = shift;

    my $responsiveness = $node->add_input('responsiveness');

    my $main_window = $node->add_output('object');

    $responsiveness->set_data(10);

    $main_window->set_data( new MainWindow );

    return 1;
}

sub task {
    my $node = shift;

    my $responsiveness = $node->get_input('responsiveness');

    my $main_window = $node->get_output('main_window');

    &DoOneEvent for ( 0 .. $responsiveness->data );

    return 1;
}

1;

=head1 NAME

PNI::Node::Tk::MainWindow - creates a Tk main window

=head1 SYNOPSIS

    use PNI ':-D';

    node 'Tk::MainWindow';

    loop;

=head1 DESCRIPTION

Every Tk program must have at least one MainWindow. 
That's why this node also handles Tk events so there is no need to call the Tk MainLoop.
Thanks to Nick Ing-Simmons in Perl/Tk can co-exist multiple MainWindows, so
it is possible to create more than one Tk::MainWindow PNI node.

=head1 INPUTS

=over 4

=item responsiveness

=back

=head1 OUTPUTS

=over 4

=item object

=back

=cut

