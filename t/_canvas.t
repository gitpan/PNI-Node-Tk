use strict;
use Test::More;
use PNI ':-D';

my $node = node 'Tk::Canvas';
isa_ok $node, 'PNI::Node::Tk::Canvas';

# check default values
ok $node->task;

my $parent = $node->get_input('parent');
my $canvas = $node->get_output('canvas');

my $mw_node     = node 'Tk::MainWindow';
my $main_window = $mw_node->get_output('object');

ok $main_window->join_to($parent);
task;
task;
sleep 1;
isa_ok $canvas->get_data, 'Tk::Canvas';

done_testing;
__END__
