# NFS Service
class nfs::service (
  $ensure = $nfs::service_ensure,
  $enable = $nfs::service_enable
) {
  include 'nfs::params'
  $services = $nfs::params::services
  $packages = $nfs::params::packages

  $client_services = $nfs::params::client_services

  service { $services:
    ensure  => $ensure,
    enable  => $enable,
    require => Package[$packages],
  }

}
