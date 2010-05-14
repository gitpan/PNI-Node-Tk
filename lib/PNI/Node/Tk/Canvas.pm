package PNI::Node::Tk::Canvas;

BEGIN { require PNI::Node , @ISA = ( 'PNI::Node' ) }

my $created = 0;

sub init {
    my $node = shift;
    $node->has_input( window => undef );
    $node->has_input( configure => {} );
    $node->has_input( pack_options => {} );

    $node->has_output( canvas );
}

sub task {
    my $node = shift;

    if( defined $node->input->{window} and not $created ) {
        $node->output->{canvas} = $node->input->{window}->Canvas();
        	       	
        $node->output->{canvas}->configure( %{ $node->input->{configure} } );
        $node->output->{canvas}->pack( %{ $node->input->{pack_options} } );
        $created = 1;
    }
}

1;
__END__

=head1 NAME

PNI::Node::Tk::Canvas

=head1 AUTHOR

G. Casati , E<lt>fibo@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2010 by G. Casati

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.1 or,
at your option, any later version of Perl 5 you may have available.

=cut

