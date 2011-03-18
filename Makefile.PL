use 5.008008008;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME         => 'PNI-Node-Tk',
    VERSION_FROM => 'lib/PNI/Node/Tk.pm',
    PREREQ_PM    => {
        PNI => 0.11,
        Tk  => 804.029
    },
    (
        $] >= 5.005
        ? (
            ABSTRACT_FROM => 'lib/PNI/Node/Tk.pm',
            AUTHOR        => 'G. Casati <fibo@cpan.org>'
          )
        : ()
    ),
);
