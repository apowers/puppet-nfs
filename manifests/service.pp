define nfs::service (
  $ensure = running,
  $enable = true
) {
  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'nfs' ],
  }

  service { $service:
    ensure => $ensure,
    enable => $enable,
  }

}
