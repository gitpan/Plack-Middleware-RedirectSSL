
use strict;
use warnings;

use 5.010;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "force all requests to use in-/secure connections",
  "AUTHOR" => "Aristotle Pagaltzis <pagaltzis\@gmx.de>",
  "BUILD_REQUIRES" => {
    "HTTP::Request::Common" => 0,
    "Plack::Builder" => 0,
    "Plack::Test" => 0,
    "Test::More" => 0,
    "warnings" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Plack-Middleware-RedirectSSL",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Plack::Middleware::RedirectSSL",
  "PREREQ_PM" => {
    "Plack" => "0.9942",
    "Plack::Middleware" => 0,
    "Plack::Request" => 0,
    "Plack::Util" => 0,
    "Plack::Util::Accessor" => 0,
    "parent" => 0,
    "strict" => 0
  },
  "VERSION" => "1.001",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



