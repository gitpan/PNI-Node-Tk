use strict;
use Test::More;

BEGIN {
    use_ok($_)
      or BAIL_OUT(" $_ module does not compile :-(")
      for qw(
      PNI::Node::Tk
      PNI::Node::Tk::Canvas::Rectangle
      PNI::Node::Tk::Canvas::Text
      PNI::Node::Tk::MainWindow
    );
}

isa_ok( $_, 'PNI::Node' ) for qw(
  PNI::Node::Tk::Canvas::Rectangle
  PNI::Node::Tk::Canvas::Text
  PNI::Node::Tk::MainWindow
);

done_testing;

