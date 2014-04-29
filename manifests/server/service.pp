# NFS Service
class nfs::service (
  $ensure   = $nfs::server::service_ensure,
  $enable   = $nfs::server::service_enable,
  $service  = $nfs::server::service_name,
) {

  service { $service:
    ensure  => $ensure,
    enable  => $enable,
  }

}
