use strict;
use warnings;
use Test::More;
use OS::Release qw( os_release );

can_ok 'OS::Release', '_parse';
can_ok 'OS::Release', 'os_release';

my $data = os_release();

diag '';
diag '';
diag '';
diag '';

foreach my $key (sort keys %$data)
{
  my $value = $data->{$key};
  diag "$key=$value";
}

diag '';
diag '';
diag '';

done_testing;
