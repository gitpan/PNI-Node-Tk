use ExtUtils::MakeMaker;

WriteMakefile
  ABSTRACT_FROM => 'lib/PNI/Node/Tk.pm',
  AUTHOR        => 'G. Casati <fibo@cpan.org>',
  NAME          => 'PNI-Node-Tk',
  PREREQ_PM     => {
    PNI => '0.16',
    Tk  => '804.029',
  },
  VERSION_FROM => 'lib/PNI/Node/Tk.pm',
