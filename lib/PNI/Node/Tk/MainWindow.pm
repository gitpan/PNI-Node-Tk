package PNI::Node::Tk::MainWindow;

#BEGIN { require PNI::Node , @ISA = ( 'PNI::Node' ) }

our @ISA = ( 'PNI::Node' );

use Tk;
my $responsiveness = 10;

sub init {
    my $node = shift;
    #$node->has_input( on_close => sub{ Tk::exit } );
    $node->has_output( main_window => new MainWindow );
}

sub task {
    my $node = shift;

    #$node->output->{main_window}->protocol( 'WM_DELETE_WINDOW' => $node->input->{on_close} );

    &DoOneEvent for ( 0 .. $responsiveness );
}

1;
__END__

=head1 NAME

PNI::Node::Tk::MainWindow

=head1 AUTHOR

G. Casati , E<lt>fibo@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2010 by G. Casati

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.1 or,
at your option, any later version of Perl 5 you may have available.

=cut

