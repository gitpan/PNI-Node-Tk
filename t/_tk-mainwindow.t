use Test::More;
use PNI;

my $node = PNI::NODE 'Tk::MainWindow';

isa_ok( $node, 'PNI::Node' );
isa_ok($node->get_input('responsiveness'),'PNI::Slot::In');
isa_ok($node->get_output('main_window'),'PNI::Slot::Out');

#is( $node->get_output('responsiveness')->get_data, 10, 'default responsiveness is 10' );
isa_ok($node->get_output('main_window')->get_data,'Tk::MainWindow');

ok( $node->task );
sleep 1;

done_testing();

