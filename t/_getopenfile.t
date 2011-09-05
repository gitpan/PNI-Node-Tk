use strict;
use PNI;
use Test::More;

my $mainwindow_node = PNI::node 'Tk::MainWindow';
my $node = PNI::node 'Tk::GetOpenFile';

ok $node->task;

done_testing;
__END__

