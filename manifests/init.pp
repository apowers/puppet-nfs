# NFS Class
#
class nfs (
  $package_ensure     = 'installed',
  $service_ensure     = 'running',
  $service_enable     = true,
  $exports            = [],
  $mountd_port        = undef,
  $statd_port         = undef,
  $lockd_port         = undef,
  $sysconfig_options  = [],
) {

  class { 'nfs::params': } ->
  class { 'nfs::package': } ->
  class { 'nfs::config': } ~>
  class { 'nfs::service': }

}
