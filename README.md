nfs
===

This module installs NFS client/server and manages some static NFS mounts.

Examples
-------

# For a Server
  $exports = [
    '/usr            *.local.domain(ro) @trusted(rw)',
    '/home/joe       pc001(rw,all_squash,anonuid=150,anongid=100)',
  ]

  class { '::nfs':
    service_ensure => 'running',
    exports        => $exports
  }

# For a Client
  class { '::nfs': }
  ::nfs::mount { '/home/joe':
    mount   => '/home/joe',
    device  = 'server1:/home/joe',
  }

