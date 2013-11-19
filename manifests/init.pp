class nfs {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [
      'nfs-utils',
      'rpcbind'
    ],
  }

  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'rpcbind' ],
  }

  package { $required: ensure  => latest }

  service { $service:
    ensure => 'running',
    enable => 'true',
    require => Package[$service],
  }

}
