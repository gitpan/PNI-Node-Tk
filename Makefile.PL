use 5.008008008;
use ExtUtils::MakeMaker;

WriteMakefile
  ABSTRACT_FROM => 'lib/PNI/Node/Tk.pod',
  AUTHOR        => 'G. Casati <fibo@cpan.org>',
  NAME          => 'PNI-Node-Tk',
  PREREQ_PM     => {
    PNI => 0.15,
    Tk  => 804.029
  },
  VERSION_FROM => 'lib/PNI/Node/Tk.pm',
