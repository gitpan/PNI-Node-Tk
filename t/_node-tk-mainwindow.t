use strict;
use Test::More;
use PNI ':-D';

my $node = node 'Tk::MainWindow';
isa_ok $node, 'PNI::Node';
isa_ok $node, 'PNI::Node::Tk::MainWindow';

# check default values
ok $node->task;

#is( $node->get_output('responsiveness')->get_data, 10, 'default responsiveness is 10' );
#isa_ok($node->get_output('main_window')->get_data,'Tk::MainWindow');

#sleep 1;

done_testing;
__END__
