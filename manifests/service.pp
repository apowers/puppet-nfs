define nfs::service (
  $service = '',
  $ensure = running,
  $enable = true
) {
  service { $service:
    ensure => $ensure,
    enable => $enable,
  }

}
