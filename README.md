# OS::Release [![Build Status](https://secure.travis-ci.org/plicease/OS-Release.png)](http://travis-ci.org/plicease/OS-Release)

Parse /etc/os-release

# SYNOPSIS

    use OS::Release qw( release );
    
    if(release->{ID} eq 'debian')
    {
      # do something for debian
    }
    elsif(release->{ID} eq 'centos')
    {
      # do something else on debian
    }

# DESCRIPTION

This module just provides a simple interface to the `/etc/os-release` file.  It caches the result
so the file is only read once.

# METHODS

## os\_release

    my $hash = os_release();

Returns a hash reference of the `os-release` data.  It will return nothing
if the file `os-release` file could not be found.

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2016 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
