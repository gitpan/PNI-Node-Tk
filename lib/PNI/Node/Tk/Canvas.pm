package PNI::Node::Tk::Canvas;

use strict;
use warnings;

our $VERSION = $PNI::Node::Tk::VERSION;

our @ISA = ( 'PNI::Node' );

sub init {
    my $node = shift;
    $node->add_input( window => undef );
    $node->add_input( configure => {} );
    $node->add_input( pack_options => {} );

    $node->add_output( canvas => undef );
}

sub task {
    my $node = shift;

    if( defined $node->get_input('window') and 
        not defined $node->get_output('canvas') ) {
        $node->get_output('canvas') = $node->get_input('window')->Canvas();
 
        $node->get_output('canvas')->configure( %{ $node->get_input('configure') } );
        $node->get_output('canvas')->pack( %{ $node->get_input('pack_options') } );
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

