use Test::More tests => 1;
use PNI;

ok( my $main_window_node = PNI::NODE( 'Tk::MainWindow' ) );

PNI::RUN;

sleep 1;
