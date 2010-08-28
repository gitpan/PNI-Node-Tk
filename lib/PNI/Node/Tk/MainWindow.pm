package PNI::Node::Tk::MainWindow;

use strict;
use warnings;

our $VERSION = $PNI::Node::Tk::VERSION;

our @ISA = ( 'PNI::Node' );

use Tk;

sub init {
    my $node = shift;
    $node->add_input( responsiveness => 10 );
    $node->add_output( main_window => new MainWindow );
}

sub task {
    my $node = shift;

    &DoOneEvent for ( 0 .. $node->get_input('responsiveness') );
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
it under the same terms as Perl itself.

=cut

