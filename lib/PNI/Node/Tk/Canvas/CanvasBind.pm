package PNI::Node::Tk::Canvas::CanvasBind;

use 5.010001;
use strict;
use warnings;

our $VERSION = '0.01';

our @ISA = ( 'PNI::Node' );

sub init {
    my $node = shift;
    
    $node->has_input( canvas => undef );
    $node->has_input( 'event_name' => '' );
    $node->has_input( 'code_ref' => sub {} );
    $node->has_input( 'args' => [] );
    $node->has_input( 'do_bind' => 0 );
}

sub task {
    my $node = shift;
    
    if( $node->input->{do_bind} ) {

        return unless defined $node->input->{canvas};
        #and $node->input->{canvas}->isa( 'Tk::Canvas' );

        # TODO aggiungi anche la possibilità di passare argomenti.
        #$node->input->{canvas}->CanvasBind( $node->input->{event_name}, [ sub { $node->input->{code_ref} }, @{ $node->input->{args} } ] );
        $node->input->{canvas}->CanvasBind( $node->input->{event_name}, [ $node->input->{code_ref} ] );

        $node->input->{do_bind} = 0;
    }
}

1;
__END__

=head1 NAME

PNI::Node::Tk::Canvas::CanvasBind

=head1 DESCRIPTION

=head1 AUTHOR

G. Casati , E<lt>fibo@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2010 by G. Casati

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.1 or,
at your option, any later version of Perl 5 you may have available.

=cut

