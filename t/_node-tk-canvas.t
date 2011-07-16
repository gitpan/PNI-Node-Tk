use strict;
use Test::More;
use PNI ':-D';

my $node = node 'Tk::Canvas';
isa_ok $node, 'PNI::Node';
isa_ok $node, 'PNI::Node::Tk::Canvas';

# check default values
ok $node->task;

my $parent = $node->get_input('parent');
my $canvas = $node->get_output('canvas');

TODO: {

    local $TODO = 'to be fixed, canvas result to be undef';
    my $node_mw     = node 'Tk::MainWindow';
    my $main_window = $node_mw->get_output('main_window');

    ok $main_window->join_to($parent);
    ok $node->task;
    isa_ok $canvas->get_data, 'Tk::Canvas';

}

done_testing;
__END__
