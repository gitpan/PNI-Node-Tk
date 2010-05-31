package PNI::Node::Tk::MainWindow;

use 5.010001;
use strict;
use warnings;

our $VERSION = '0.01';

our @ISA = ( 'PNI::Node' );

use Tk;

sub init {
    my $node = shift;
    #$node->has_input( on_close => sub{ Tk::exit } );
    $node->has_input( responsiveness => 10 );
    $node->has_output( main_window => new MainWindow );
}

sub task {
    my $node = shift;

    #$node->output->{main_window}->protocol( 'WM_DELETE_WINDOW' => $node->input->{on_close} );

    &DoOneEvent for ( 0 .. $node->input->{responsiveness} );
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

=head1 AUTHOR

G. Casati , E<lt>fibo@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2010 by G. Casati

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.1 or,
at your option, any later version of Perl 5 you may have available.

=cut

