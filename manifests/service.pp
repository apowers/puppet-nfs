define nfs::service (
  $ensure = $nfs::service_ensure,
  $enable = $nfs::service_enable
) {
  include 'nfs::params'
  $services = $nfs::params::services

  service { $services:
    ensure => $ensure,
    enable => $enable,
    require => Package[$service],
  }

}
