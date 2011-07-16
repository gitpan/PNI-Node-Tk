use strict;
use Test::More;
use PNI ':-D';

my $node = node 'Tk::Canvas::Text';
isa_ok $node, 'PNI::Node';
isa_ok $node, 'PNI::Node::Tk::Canvas::Text';

# check default values
ok $node->task;

use Tk;

my $canvas = $node->get_input('canvas');
my $text   = $node->get_input('text');
my $y      = $node->get_input('y');
my $x      = $node->get_input('x');

my $tk_id = $node->get_output('tk_id');

my $tk_canvas = MainWindow->new->Canvas;
$canvas->set_data($tk_canvas);
$text->set_data('Some string');
$y->set_data(10);
$x->set_data(10);

ok $node->task;

ok $tk_id->get_data;

done_testing;
__END__
