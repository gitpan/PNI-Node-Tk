use strict;
use Test::More;

BEGIN {
    use_ok($_)
      or BAIL_OUT(" $_ module is not installed")
      for qw(
	  PNI
	  Tk
    );
}

done_testing;

