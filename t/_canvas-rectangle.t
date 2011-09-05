use strict;
use Test::More;
use PNI ':-D';

my $node = node 'Tk::Canvas::Rectangle';
isa_ok $node, 'PNI::Node';
isa_ok $node, 'PNI::Node::Tk::Canvas::Rectangle';

# check default values
ok $node->task;

done_testing;
__END__
