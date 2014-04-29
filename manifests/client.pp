# NFS Class
#
class nfs::client (
  $package_ensure     = 'installed',
  $package_name       = $nfs::params::packages,
  $service_ensure     = 'running',
  $service_enable     = true,
  $service_name       = $nfs::params::client_service_name,
  $mountd_port        = undef,
  $statd_port         = undef,
  $lockd_port         = undef,
  $sysconfig_options  = [],
) inherits nfs::params {

  class { 'nfs::client::package': } ->
  class { 'nfs::client::config': } ~>
  class { 'nfs::client::service': }

}
