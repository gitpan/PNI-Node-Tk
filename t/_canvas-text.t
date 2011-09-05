use strict;
use Test::More;
use PNI ':-D';

my $node = node 'Tk::Canvas::Text';
isa_ok $node, 'PNI::Node::Tk::Canvas::Text';

# check default values
ok $node->task;


my $canvas = $node->get_input('canvas');
my $text   = $node->get_input('text');
my $y      = $node->get_input('y');
my $x      = $node->get_input('x');

my $tk_id = $node->get_output('tk_id');

my $mw_node = node 'Tk::MainWindow';
my $canvas_node = node 'Tk::Canvas';
$mw_node->get_output('object')->join_to($canvas_node->get_input('parent'));
$canvas_node->get_output('canvas')->join_to($canvas);

task;
task;

is $node->get_input('canvas')->get_data,$canvas_node->get_output('canvas')->get_data;
$text->set_data('Perl');
$y->set_data(100);
$x->set_data(100);

task;

sleep 1;

is $text->get_data,'Perl';
is $y->get_data,100;
is $x->get_data,100;

ok $tk_id->get_data;

$text->set_data('Rules!');

task;
task;

is $text->get_data,'Rules!';

sleep 1;

# TODO fai qualcosa di coreografico tipo la scritta Welcome to PNI che compare lettera per lettera 


done_testing
__END__
