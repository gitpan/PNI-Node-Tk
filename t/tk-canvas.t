use Test::More;
use PNI;

my $node = PNI::NODE 'Tk::Canvas';

isa_ok( $node,                              'PNI::Node' );
isa_ok( $node->get_input('parent'),         'PNI::Slot::In' );
isa_ok( $node->get_input('configure_opts'), 'PNI::Slot::In' );
isa_ok( $node->get_input('pack_opts'),      'PNI::Slot::In' );
isa_ok( $node->get_output('canvas'),        'PNI::Slot::Out' );

$node->get_input('parent')->set_data( PNI::NODE 'Tk::MainWindow' );

ok( $node->task );
isa_ok( $node->get_output('canvas')->get_data, 'Tk::Canvas' );

done_testing();

