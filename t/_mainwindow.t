use strict;
use Test::More;
use PNI ':-D';

my $node = node 'Tk::MainWindow';
isa_ok $node, 'PNI::Node::Tk::MainWindow';

# check default values
ok $node->task;

is $node->get_input('responsiveness')->get_data, 10, 'default responsiveness';
isa_ok $node->get_output('object')->get_data, 'Tk::MainWindow';

task;
sleep 1;

# TODO test passando valori a responsiveness

done_testing;
__END__
