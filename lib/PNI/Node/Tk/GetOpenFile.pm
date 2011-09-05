package PNI::Node::Tk::GetOpenFile;
use parent 'PNI::Node';
use strict;

sub init {
    my $node = shift;

    $node->add_input( do_open => 0 );
    $node->add_input('parent');
    $node->add_input( 'title' , data => 'Title' );

    $node->add_output('path');
}

sub task {
    my $node = shift;

    my $do_open = $node->get_input('do_open');
    my $parent = $node->get_input('parent');
    my $title = $node->get_input('title');

    my $path = $node->get_output('path');

    return 1 unless $do_open->get_data;

    return 1 unless $parent->get_data;

    my $file = $parent->get_data->getOpenFile( -title => $title->get_data );

    $path->set_data($file);

    return $do_open->set_data(1);
}

1;
__END__

=head1 NAME

PNI::Node::Tk::GetOpenFile

=cut

