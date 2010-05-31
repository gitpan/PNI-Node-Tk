use 5.12.0;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME => 'PNI::Node::Tk',
    VERSION_FROM => 'lib/PNI/Node/Tk.pod', # finds $VERSION
    PREREQ_PM => { 
        PNI => 0 , 
        Tk => 0 
    },
    (
        $] >= 5.005 ?     ## Add these new keywords supported since 5.005
        (
            ABSTRACT_FROM => 'lib/PNI/Node/Tk.pod', # retrieve abstract from module
            AUTHOR => 'G. Casati <fibo@cpan.org>'
        ) : ()
    ),
);
