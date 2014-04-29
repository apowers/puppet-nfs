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

  class { 'nfs::client':
    package_ensure     => $package_ensure,
    service_ensure     => $service_ensure,
    service_enable     => $service_enable,
    mountd_port        => $mountd_port,
    statd_port         => $statd_port,
    lockd_port         => $lockd_port,
    sysconfig_options  => $sysconfig_options,
  }

}
