package OS::Release;

use strict;
use warnings;
use feature qw( state );
use base qw( Exporter );

# ABSTRACT: Parse /etc/os-release
# VERSION

=head1 SYNOPSIS

 use OS::Release qw( release );
 
 if(release->{ID} eq 'debian')
 {
   # do something for debian
 }
 elsif(release->{ID} eq 'centos')
 {
   # do something else on debian
 }

=head1 DESCRIPTION

This module just provides a simple interface to the C</etc/os-release> file.  It caches the result
so the file is only read once.

=cut

require XSLoader;
XSLoader::load('OS::Release', $VERSION);

our @EXPORT_OK = qw( os_release );

=head1 METHODS

=head2 os_release

 my $hash = os_release();

Returns a hash reference of the C<os-release> data.  It will return nothing
if the file C<os-release> file could not be found.

=cut

sub os_release
{
  state $data;
  $data //= _parse();
}

1;
