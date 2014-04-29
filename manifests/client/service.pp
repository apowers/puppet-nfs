# NFS Service
class nfs::client::service (
  $ensure   = $nfs::client::service_ensure,
  $enable   = $nfs::client::service_enable,
  $service  = $nfs::client::service_name,
) {

  service { $service :
    ensure  => $ensure,
    enable  => $enable,
  }

}
