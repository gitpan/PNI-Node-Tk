use 5.008008008;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME         => 'PNI::Node::Tk',
    VERSION => '0.1',
    PREREQ_PM    => {
        PNI => 0.1,
        Tk  => 0
    },
    (
        $] >= 5.005
        ? (
            ABSTRACT_FROM => 'lib/PNI/Node/Tk.pod',
            AUTHOR        => 'G. Casati <fibo@cpan.org>'
          )
        : ()
    ),
);
