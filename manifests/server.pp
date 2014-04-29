# NFS Class
#
class nfs::server (
  $package_ensure     = 'installed',
  $package_name       = $nfs::params::packages,
  $service_ensure     = 'running',
  $service_enable     = true,
  $service_name       = $nfs::params::services,
  $exports            = [],
  $mountd_port        = undef,
  $statd_port         = undef,
  $lockd_port         = undef,
  $sysconfig_options  = [],
) inherits nfs::params {

  class { 'nfs::params': } ->
  class { 'nfs::server::package': } ->
  class { 'nfs::server::config': } ~>
  class { 'nfs::server::service': }

}
